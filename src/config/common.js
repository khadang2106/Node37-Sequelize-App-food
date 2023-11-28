export const generateArrSubId = () => {
  const timestamp = new Date().getTime();
  return `SUBORDER${timestamp}`;
};
