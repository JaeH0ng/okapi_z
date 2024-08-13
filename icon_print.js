//ex.  node icon_print.js Home

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import * as IconPark from '@icon-park/svg';

// 현재 디렉토리와 아이콘 폴더 경로 설정
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// 실행 중인 프로젝트의 루트 경로를 찾습니다.
const projectRoot = path.resolve(__dirname, '../okapi_z');

// 프로젝트의 assets/icons 폴더 경로로 설정
const iconsDir = path.join(projectRoot, 'assets', 'icons');

// 터미널에서 아이콘 이름 입력받기
const args = process.argv.slice(2);
if (args.length === 0) {
  console.error('아이콘 이름을 입력하세요.');
  process.exit(1);
}

const iconName = args[0];

// 아이콘이 존재하는지 확인하고, 존재하지 않으면 에러 메시지 출력
if (!IconPark[iconName]) {
  console.error(`아이콘 "${iconName}"을(를) 찾을 수 없습니다.`);
  process.exit(1);
}

// 아이콘 SVG 코드 생성
const svg = IconPark[iconName]({ theme: 'outline', size: '24px' });

// icons 폴더가 존재하지 않으면 생성
if (!fs.existsSync(iconsDir)) {
  fs.mkdirSync(iconsDir, { recursive: true });
}

// 아이콘 SVG 파일 경로 설정
const iconFilePath = path.join(iconsDir, `${iconName}.svg`);

// 아이콘 SVG 파일 저장
fs.writeFileSync(iconFilePath, svg);
console.log(`아이콘 "${iconName}"이(가) ${iconFilePath}에 저장되었습니다.`);
