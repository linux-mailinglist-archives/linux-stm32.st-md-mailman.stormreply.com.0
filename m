Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 873DF225EAD
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jul 2020 14:38:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44680C36B2A;
	Mon, 20 Jul 2020 12:38:06 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1AA7EC36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jul 2020 12:38:03 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06KCXEwk165106;
 Mon, 20 Jul 2020 12:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=9kXHHwVK1pHrizFKFmjZl4Mw/esySJJ8iCZPdLwUu7c=;
 b=yBgA/5fk6RZk+tqBOt8hPYKV24S42geytsRBQHYTTGz68n6CE5dtRL88nu2raS6tEbyG
 GFb0RhlAWYY49VEi0U/tP1sjGxy8/VSpvx+mZ8Hah94zKxqwkF+NTigwZBkb2oqTy/LC
 6swqKfRwma34QE8mZtIpey5PILzb2cIoMWH3vfSpf7MBe9b5Vrmr5rkPv3CQ6yauDUIK
 JjF+7PACggxRrEaKYh5BqRkiVOx+wUIPgZlv9BMwU3vFslUr/IKTvcz2UcQoxpLGD9io
 V+c+lUNRZzxFy3UyieMibc2vr1zjkC+63EMm8AwJSIGG7bWcpuPP1TOd3s3p8QP5adrJ ow== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 32bs1m6n0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 Jul 2020 12:37:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06KCXuF6097037;
 Mon, 20 Jul 2020 12:37:54 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 32d8kyr5ed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jul 2020 12:37:54 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06KCbq9w011850;
 Mon, 20 Jul 2020 12:37:53 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 20 Jul 2020 12:37:52 +0000
Date: Mon, 20 Jul 2020 15:37:47 +0300
From: <dan.carpenter@oracle.com>
To: christophe.kerello@st.com
Message-ID: <20200720123747.GA58697@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9687
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=3
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007200086
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9687
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 bulkscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 clxscore=1011
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007200086
Cc: linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [bug report] mtd: rawnand: stm32_fmc2: add STM32 FMC2
 NAND flash controller driver
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello Christophe Kerello,

The patch 2cd457f328c1: "mtd: rawnand: stm32_fmc2: add STM32 FMC2
NAND flash controller driver" from Dec 14, 2018, leads to the
following static checker warning:

	drivers/mtd/nand/raw/stm32_fmc2_nand.c:350 stm32_fmc2_nfc_select_chip()
	error: buffer overflow 'nfc->data_phys_addr' 2 <= 2

drivers/mtd/nand/raw/stm32_fmc2_nand.c
   334  static int stm32_fmc2_nfc_select_chip(struct nand_chip *chip, int chipnr)
   335  {
   336          struct stm32_fmc2_nfc *nfc = to_stm32_nfc(chip->controller);
   337          struct stm32_fmc2_nand *nand = to_fmc2_nand(chip);
   338          struct dma_slave_config dma_cfg;
   339          int ret;
   340  
   341          if (nand->cs_used[chipnr] == nfc->cs_sel)
   342                  return 0;
   343  
   344          nfc->cs_sel = nand->cs_used[chipnr];
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

   345          stm32_fmc2_nfc_setup(chip);
   346          stm32_fmc2_nfc_timings_init(chip);
   347  
   348          if (nfc->dma_tx_ch && nfc->dma_rx_ch) {
   349                  memset(&dma_cfg, 0, sizeof(dma_cfg));
   350                  dma_cfg.src_addr = nfc->data_phys_addr[nfc->cs_sel];

The ->data_phys_addr[] array has FMC2_MAX_CE elements.

   351                  dma_cfg.dst_addr = nfc->data_phys_addr[nfc->cs_sel];
   352                  dma_cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
   353                  dma_cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
   354                  dma_cfg.src_maxburst = 32;
   355                  dma_cfg.dst_maxburst = 32;
   356  
   357                  ret = dmaengine_slave_config(nfc->dma_tx_ch, &dma_cfg);

[ snip ]

  1741  static int stm32_fmc2_nfc_parse_child(struct stm32_fmc2_nfc *nfc,
  1742                                        struct device_node *dn)
  1743  {
  1744          struct stm32_fmc2_nand *nand = &nfc->nand;
  1745          u32 cs;
  1746          int ret, i;
  1747  
  1748          if (!of_get_property(dn, "reg", &nand->ncs))
  1749                  return -EINVAL;
  1750  
  1751          nand->ncs /= sizeof(u32);
  1752          if (!nand->ncs) {
  1753                  dev_err(nfc->dev, "invalid reg property size\n");
  1754                  return -EINVAL;
  1755          }
  1756  
  1757          for (i = 0; i < nand->ncs; i++) {
  1758                  ret = of_property_read_u32_index(dn, "reg", i, &cs);
  1759                  if (ret) {
  1760                          dev_err(nfc->dev, "could not retrieve reg property: %d\n",
  1761                                  ret);
  1762                          return ret;
  1763                  }
  1764  
  1765                  if (cs > FMC2_MAX_CE) {

Which suggests that this should be >= FMC2_MAX_CE to prevent an off by
one.

  1766                          dev_err(nfc->dev, "invalid reg value: %d\n", cs);
  1767                          return -EINVAL;
  1768                  }
  1769  
  1770                  if (nfc->cs_assigned & BIT(cs)) {
  1771                          dev_err(nfc->dev, "cs already assigned: %d\n", cs);
  1772                          return -EINVAL;
  1773                  }
  1774  
  1775                  nfc->cs_assigned |= BIT(cs);
  1776                  nand->cs_used[i] = cs;
                        ^^^^^^^^^^^^^^^^^^^^^
  1777          }

regards,
dan carpenter
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
