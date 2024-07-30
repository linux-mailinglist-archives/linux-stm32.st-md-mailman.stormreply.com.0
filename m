Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFBC94149B
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jul 2024 16:44:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02C2EC71290;
	Tue, 30 Jul 2024 14:44:48 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC5E3C6DD9B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2024 14:44:40 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46U94WDv031483;
 Tue, 30 Jul 2024 14:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MasjXBbdtti/tUvRQO3a+/9TKxAw1hY5TGiQuO0YhoY=; b=WLOQONYOiNCH48Np
 ju1A//moaWTI9oYA3FYloq4jY5lveT5/75u0BW5rhe4BXRLtClm3CGeHFfLgUVSd
 4dMe+QSiVx2jQIZDxGbt8QweYYISgaciACGqgKW16d+X/vbh/6j6G4cLCQZjOTy/
 R5r/qD5J3tbUn5hy/UtMZhT7KVD8FUXkwKxNWTkysDyp/mtQINI/JWzmDq8+Yfh6
 Azg/qCtaY9xBetMKw1EvzXjvPG1Vfw5CGGkCEX6SunBIFoTsO3B+AGP187faviPq
 t3zzymhj6wNet3e+YW0soVvOL1f0FSiAr4vvon/iWMayKjJ6mUlfV2Mz/Yi9gTc9
 8xocvQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mqw77tnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jul 2024 14:43:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46UEhMXU024190
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jul 2024 14:43:23 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Jul
 2024 07:43:23 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 30 Jul 2024 07:43:19 -0700
MIME-Version: 1.0
Message-ID: <20240730-module_description_orphans-v1-2-7094088076c8@quicinc.com>
References: <20240730-module_description_orphans-v1-0-7094088076c8@quicinc.com>
In-Reply-To: <20240730-module_description_orphans-v1-0-7094088076c8@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Russell King
 <linux@armlinux.org.uk>, Steven Rostedt <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, Karol Herbst <karolherbst@gmail.com>,
 "Pekka Paalanen" <ppaalanen@gmail.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Jeremy Kerr <jk@ozlabs.org>,
 Joel Stanley <joel@jms.id.au>, Alistar Popple <alistair@popple.id.au>,
 Eddie James <eajames@linux.ibm.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Will Deacon <will@kernel.org>, Waiman Long
 <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ti9c1oLGTxJ4R50aylyu_ScVMIASYCzE
X-Proofpoint-GUID: ti9c1oLGTxJ4R50aylyu_ScVMIASYCzE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_12,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=899 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300100
Cc: linux-aspeed@lists.ozlabs.org, linux-pm@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jeff Johnson <quic_jjohnson@quicinc.com>, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-fsi@lists.ozlabs.org
Subject: [Linux-stm32] [PATCH 2/5] x86/mm: add testmmiotrace
	MODULE_DESCRIPTION()
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

Fix the following 'make W=1' warning:

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/mm/testmmiotrace.o

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 arch/x86/mm/testmmiotrace.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/mm/testmmiotrace.c b/arch/x86/mm/testmmiotrace.c
index bda73cb7a044..ae295659ca14 100644
--- a/arch/x86/mm/testmmiotrace.c
+++ b/arch/x86/mm/testmmiotrace.c
@@ -144,3 +144,4 @@ static void __exit cleanup(void)
 module_init(init);
 module_exit(cleanup);
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Test module for mmiotrace");

-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
