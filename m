Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6522694149E
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jul 2024 16:44:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23687C6DD9B;
	Tue, 30 Jul 2024 14:44:57 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FC70C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2024 14:44:55 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46U8oTu8030643;
 Tue, 30 Jul 2024 14:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=VTmK3GjGI/TBE6OcQTcx58
 PFaZ9r/Rx2aijf6ZEGqEI=; b=p6s9VYHn9TETG5axfmxtd5gqA2n5j1jQPNwlGx
 8Zua/2vQqxHiQpf68K7BoczHsZ8MFWoLOVbWeqKxvGnLFGcP9pE40T2vxhFGNo2k
 StZ2wTlDUtLzh8JzUA0l+ZJgZg4gmNDcgtNehGXyErG4x1zthlAcQZwUB/MqN44j
 hDFINNM9FfM0XjkI9L5WqF/wbuyZGtHQT1H6ox+mujEAmVu/1cvQkzxKiqVDbbRj
 Qff8U8WSJMn8nRbY1/ShLdVI+5b5/Njh/mw5/gR7R/zg7KuRRXqTgNozC7LCm6s5
 OyPagNcZJWN+vAmKg4034J0TvDndsF1CTgsItM9TQT8UUlog==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40ms96qw3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jul 2024 14:43:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46UEhMXS024190
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jul 2024 14:43:22 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Jul
 2024 07:43:22 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 30 Jul 2024 07:43:17 -0700
Message-ID: <20240730-module_description_orphans-v1-0-7094088076c8@quicinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAX8qGYC/x3M3QqDMAxA4VeRXK9Q3epgrzKG9CfOgLYl0SGI7
 75slx8czgGCTCjwaA5g/JBQyYr20kCcfH6joaSGznY3e79as5S0zTgklMhUV82HwlVTMTE47Ny
 Ibe960EFlHGn/z58vdfCCJrDPcfotZ8rbbhYvKzKc5xewh/gziwAAAA==
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
X-Proofpoint-ORIG-GUID: KtDrELCmddYI6T-uWPbmkiTEYMVdwz7x
X-Proofpoint-GUID: KtDrELCmddYI6T-uWPbmkiTEYMVdwz7x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_12,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 mlxlogscore=738 bulkscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 spamscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300100
Cc: linux-aspeed@lists.ozlabs.org, linux-pm@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jeff Johnson <quic_jjohnson@quicinc.com>, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-fsi@lists.ozlabs.org
Subject: [Linux-stm32] [PATCH 0/5] treewide: add missing
	MODULE_DESCRIPTION() macros
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

Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
description is missing"), a module without a MODULE_DESCRIPTION() will
result in a warning when built with make W=1.

Recently, multiple developers have been eradicating these warnings
treewide, and I personally submitted almost 300 patches over the past
few months. Almost all of my patches landed by 6.11-rc1, either by
being merged in a 6.10-rc or by being merged in the 6.11 merge
window. However, a few of my patches did not land.

In some cases I see them in linux-next, but they did not land during
the merge window. I'm still monitoring those.

In a few cases I have not had any feedback that the patches have been
accepted into a maintainer's tree. At the advice of Greg KH I've
consolidated those patches into this single series with the hope these
can still land before 6.11-final.
https://lore.kernel.org/all/2024071518-ridden-election-8118@gregkh/

Links to the original individual patches:

crypto: arm/xor - add missing MODULE_DESCRIPTION() macro
https://lore.kernel.org/all/20240711-md-arm-arch-arm-lib-v2-1-ab08653dc106@quicinc.com/

x86/mm: add testmmiotrace MODULE_DESCRIPTION()
https://lore.kernel.org/all/20240515-testmmiotrace-md-v1-1-10919a8b2842@quicinc.com/

cpufreq: powerpc: add missing MODULE_DESCRIPTION() macros
https://lore.kernel.org/all/20240722-md-powerpc-drivers-cpufreq-v2-1-bb84d715eb3d@quicinc.com/

fsi: add missing MODULE_DESCRIPTION() macros
https://lore.kernel.org/all/20240605-md-drivers-fsi-v1-1-fefc82d81b12@quicinc.com/

locking/ww_mutex/test: add MODULE_DESCRIPTION()
https://lore.kernel.org/all/20240528-md-test-ww_mutex-v2-1-a2a19e920b12@quicinc.com/

---
Jeff Johnson (5):
      crypto: arm/xor - add missing MODULE_DESCRIPTION() macro
      x86/mm: add testmmiotrace MODULE_DESCRIPTION()
      cpufreq: powerpc: add missing MODULE_DESCRIPTION() macros
      fsi: add missing MODULE_DESCRIPTION() macros
      locking/ww_mutex/test: add MODULE_DESCRIPTION()

 arch/arm/lib/xor-neon.c           | 1 +
 arch/x86/mm/testmmiotrace.c       | 1 +
 drivers/cpufreq/maple-cpufreq.c   | 1 +
 drivers/cpufreq/pasemi-cpufreq.c  | 1 +
 drivers/cpufreq/pmac64-cpufreq.c  | 1 +
 drivers/cpufreq/powernv-cpufreq.c | 1 +
 drivers/cpufreq/ppc_cbe_cpufreq.c | 1 +
 drivers/fsi/fsi-core.c            | 1 +
 drivers/fsi/fsi-master-aspeed.c   | 1 +
 drivers/fsi/fsi-master-ast-cf.c   | 3 ++-
 drivers/fsi/fsi-master-gpio.c     | 1 +
 drivers/fsi/fsi-master-hub.c      | 1 +
 drivers/fsi/fsi-scom.c            | 1 +
 kernel/locking/test-ww_mutex.c    | 1 +
 14 files changed, 15 insertions(+), 1 deletion(-)
---
base-commit: 94ede2a3e9135764736221c080ac7c0ad993dc2d
change-id: 20240730-module_description_orphans-cb5e25fe1656

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
