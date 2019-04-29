Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BD4E00D
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2019 12:03:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1A16C35E04
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2019 10:03:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25414C35E03
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2019 10:03:49 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3TA1tJt011176; Mon, 29 Apr 2019 12:03:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=LkTdd7E2MxZuZ4AhmICRbNTuZ1ixfkA53WYKdrN9npk=;
 b=SD2E0nKfOMxwPrVw2n4TTD3MlLzQohPG5VZpT/RgP3SE7fkv7PMMGIarObjZb7I6+EuU
 FMy8sId/yreAFqnFbi7KFu2nkxOUCzB8DoV94Gj87D0FVStTyGrhVL0ldpjNp0dBVfZO
 4hw3j4aECgngrCZ9V7vmV0M1rsOMinVTonGMHWkig1oj3mIBKTIrMgJa05oTgKaqDULC
 Ca/iZw9/69yBM1NA0sU6vvZCJkurZdTkSLloB6Xu4ksUtKfCFvKxsh6WNxTZw7TW03JB
 X2sUa92F61L4PZbBFgBPllFWmv/60fQ0XIxRYyvq4wHOheof6JJzQ4Z7XztETvd3EA7B OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2s4cj0bfqn-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 29 Apr 2019 12:03:38 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 88AE53D;
 Mon, 29 Apr 2019 10:03:37 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 63D281516;
 Mon, 29 Apr 2019 10:03:37 +0000 (GMT)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 29 Apr
 2019 12:03:37 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1347.000; Mon, 29 Apr 2019 12:03:36 +0200
From: Gerald BAEZA <gerald.baeza@st.com>
To: "will.deacon@arm.com" <will.deacon@arm.com>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE
 <alexandre.torgue@st.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "olof@lixom.net"
 <olof@lixom.net>,
 "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>,
 "arnd@arndb.de" <arnd@arndb.de>
Thread-Topic: [PATCH 1/5] Documentation: perf: stm32: ddrperfm support
Thread-Index: AQHU/nLPEHho1416oEiblCko4nynGA==
Date: Mon, 29 Apr 2019 10:03:36 +0000
Message-ID: <1556532194-27904-2-git-send-email-gerald.baeza@st.com>
References: <1556532194-27904-1-git-send-email-gerald.baeza@st.com>
In-Reply-To: <1556532194-27904-1-git-send-email-gerald.baeza@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-29_05:, , signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Gerald BAEZA <gerald.baeza@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH 1/5] Documentation: perf: stm32: ddrperfm
	support
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

The DDRPERFM is the DDR Performance Monitor embedded in STM32MP1 SOC.

This documentation introduces the DDRPERFM, the stm32-ddr-pmu driver
supporting it and how to use it with the perf tool.

Signed-off-by: Gerald Baeza <gerald.baeza@st.com>
---
 Documentation/perf/stm32-ddr-pmu.txt | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/perf/stm32-ddr-pmu.txt

diff --git a/Documentation/perf/stm32-ddr-pmu.txt b/Documentation/perf/stm32-ddr-pmu.txt
new file mode 100644
index 0000000..d5b35b3
--- /dev/null
+++ b/Documentation/perf/stm32-ddr-pmu.txt
@@ -0,0 +1,41 @@
+STM32 DDR Performance Monitor (DDRPERFM)
+========================================
+
+The DDRPERFM is the DDR Performance Monitor embedded in STM32MP1 SOC.
+See STM32MP157 reference manual RM0436 to get a description of this peripheral.
+
+
+The five following counters are supported by stm32-ddr-pmu driver:
+	cnt0: read operations counters		(read_cnt)
+	cnt1: write operations counters		(write_cnt)
+	cnt2: active state counters		(activate_cnt)
+	cnt3: idle state counters		(idle_cnt)
+	tcnt: time count, present for all sets	(time_cnt)
+
+The stm32-ddr-pmu driver relies on the perf PMU framework to expose the
+counters via sysfs:
+	$ ls /sys/bus/event_source/devices/ddrperfm/events
+	activate_cnt  idle_cnt  read_cnt  time_cnt  write_cnt
+
+
+The perf PMU framework is usually invoked via the 'perf stat' tool.
+
+The DDRPERFM is a system monitor that cannot isolate the traffic coming from a
+given thread or CPU, that is why stm32-ddr-pmu driver rejects any 'perf stat'
+call that does not request a system-wide collection: the '-a, --all-cpus'
+option is mandatory!
+
+Example:
+	$ perf stat -e ddrperfm/read_cnt/,ddrperfm/time_cnt/ -a sleep 20
+	Performance counter stats for 'system wide':
+
+	         342541560      ddrperfm/read_cnt/
+	       10660011400      ddrperfm/time_cnt/
+
+	      20.021068551 seconds time elapsed
+
+
+The driver also exposes a 'bandwidth' attribute that can be used to display
+the read/write/total bandwidth achieved during the last 'perf stat' execution.
+	$ cat /sys/bus/event_source/devices/ddrperfm/bandwidth
+	Read = 403, Write = 239, Read & Write = 642 (MB/s)
-- 
2.7.4
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
