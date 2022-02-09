Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 230584AEF84
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Feb 2022 11:49:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF548C6046B;
	Wed,  9 Feb 2022 10:49:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD630C5E2C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Feb 2022 10:49:18 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2199DowN018111;
 Wed, 9 Feb 2022 11:49:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=u3Ts4w97nsDuGCr+80FPyJOW2YzAPlQD8H3fZwIxWAU=;
 b=Pa/oW3uTKrrtWhibPtsrT+x/X36RFvJ51q9y4y1G3b/gIynruduKpPXKQJkzocepXlSI
 8k6VQW+AMlbxF6IqNiDe3/CGh26ZXdGLFQPH8STiXMDlePV23vUepIMWC2IYuIRAjq/3
 P4Ret2x6+tXgQsXCYUgm+bfUmRvZjcn0owZV6oGvdXyADl7W3bkzXDfe4Lj+eZXBKP94
 FM6M6oe9M/Gq/CVgnuRKAp6XkjzRxoTKO0AA3aPLtEm5VhTNPrDnHI3h2oU2s/BqvCSb
 Vj2yRuYRpORUnEe6pLXidh4tvHjs7tnNCRWJUFqG06Udhb0zsvj58SLUhoBx4W5NIcst qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e4asygkya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 11:49:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 943A110002A;
 Wed,  9 Feb 2022 11:48:59 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 88CC0215126;
 Wed,  9 Feb 2022 11:48:59 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 9 Feb 2022 11:48:59
 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <alexandre.torgue@foss.st.com>, <robh+dt@kernel.org>
Date: Wed, 9 Feb 2022 11:48:47 +0100
Message-ID: <1644403729-22665-1-git-send-email-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-09_05,2022-02-09_01,2021-12-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] ARM: dts: stm32: remove timer duplicate
	unit-address on stm32f7 series
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

Remove a series of warnings seen when building with W=1, like:
Warning (unique_unit_address): /soc/timer@40000c00: duplicate unit-address
(also used in node /soc/timers@40000c00)

This approach is based on some discussions[1], to restructure the dtsi
and dts files.
[1] https://lore.kernel.org/linux-arm-kernel/Yaf4jiZIp8+ndaXs@robh.at.kernel.org/

 arch/arm/boot/dts/stm32746g-eval.dts  | 12 +++++++++
 arch/arm/boot/dts/stm32f746-disco.dts | 12 +++++++++
 arch/arm/boot/dts/stm32f746.dtsi      | 47 -----------------------------------
 arch/arm/boot/dts/stm32f769-disco.dts | 12 +++++++++
 4 files changed, 36 insertions(+), 47 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
