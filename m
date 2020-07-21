Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 891B0227FD4
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jul 2020 14:20:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A071C36B2A;
	Tue, 21 Jul 2020 12:20:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9567C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jul 2020 12:20:46 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06LCDKms005348; Tue, 21 Jul 2020 14:20:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=8vP1jXV2kKgz7aR8mJyB4fFv5nSz+KvD2siLVIEFFi0=;
 b=CjAvouVpDIXWRLz0WMnm2myUrWADTdNPWZTdxXe2+LwCaaRlsuZ3OX3ZTLMxFWInj5CG
 K8bX/rx6Lut1aF356CFRE268amwO5IPI1WQjn27PmIIACY2lx0HhglKVZ9mcIUTmFPg4
 ttwZfYbMtkIrAm3kYws2+zaDp3iZh+wtbREQh7MxPOx/A4eU/mcIjOtSFRDpnZ/fL0AS
 0n87DittucpPeagrJYXP6mHrnm+8ruj81wYqgbBmyYEZzvKe0hT/lGR0iO72hjCAfFWG
 Sq59kThMqruYcvN0psmJeJDX/FwweaMohPpkriovMSGTqFxxCoHNkYpi1tJW9cv95NdI mQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32bsfpdrj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 14:20:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 73D7110002A;
 Tue, 21 Jul 2020 14:20:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 681DB2BC7A9;
 Tue, 21 Jul 2020 14:20:40 +0200 (CEST)
Received: from [10.48.0.224] (10.75.127.48) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Jul
 2020 14:20:40 +0200
To: <dan.carpenter@oracle.com>
References: <20200720123747.GA58697@mwanda>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <ce570a06-35ca-1bef-5b3e-eabba5f0acd2@st.com>
Date: Tue, 21 Jul 2020 14:20:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200720123747.GA58697@mwanda>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_05:2020-07-21,
 2020-07-21 signatures=0
Cc: linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [bug report] mtd: rawnand: stm32_fmc2: add STM32
 FMC2 NAND flash controller driver
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Dan,

On 7/20/20 2:37 PM, dan.carpenter@oracle.com wrote:
> 1741  static int stm32_fmc2_nfc_parse_child(struct stm32_fmc2_nfc *nfc,
>    1742                                        struct device_node *dn)
>    1743  {
>    1744          struct stm32_fmc2_nand *nand = &nfc->nand;
>    1745          u32 cs;
>    1746          int ret, i;
>    1747
>    1748          if (!of_get_property(dn, "reg", &nand->ncs))
>    1749                  return -EINVAL;
>    1750
>    1751          nand->ncs /= sizeof(u32);
>    1752          if (!nand->ncs) {
>    1753                  dev_err(nfc->dev, "invalid reg property size\n");
>    1754                  return -EINVAL;
>    1755          }
>    1756
>    1757          for (i = 0; i < nand->ncs; i++) {
>    1758                  ret = of_property_read_u32_index(dn, "reg", i, &cs);
>    1759                  if (ret) {
>    1760                          dev_err(nfc->dev, "could not retrieve reg property: %d\n",
>    1761                                  ret);
>    1762                          return ret;
>    1763                  }
>    1764
>    1765                  if (cs > FMC2_MAX_CE) {
> 
> Which suggests that this should be >= FMC2_MAX_CE to prevent an off by
> one.

Thanks for reporting this issue.
A patch has been sent to solve it. 
(https://patchwork.ozlabs.org/project/linux-mtd/patch/1595325127-32693-1-git-send-email-christophe.kerello@st.com/)

Regards,
Christophe Kerello.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
