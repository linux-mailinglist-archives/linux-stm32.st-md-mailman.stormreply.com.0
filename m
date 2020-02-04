Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D737B151883
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Feb 2020 11:11:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EACAC36B12;
	Tue,  4 Feb 2020 10:11:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34AADC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Feb 2020 10:10:59 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 014A5eas027812; Tue, 4 Feb 2020 11:10:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=LKI8G68MpBnrq3cMYnWhas9QoAyLUbV2xIYeGqpMMjQ=;
 b=Lsm6BuNWh6WT4pYMHdTJHrK2sHcXbMG9yVG/sZYxSqwQ8H7yXDXCFTKf4P8FXb1+6rci
 mVnmzXFeVrXOEvet4ooBwWqnzwpF8y4/Dx5BPXkeae11AEE03D8sTFDPeroaOi2pVhwy
 FR0vzizXk3sFMjJRErsNaiu/G19geAFyyrhoSp3CXblzJmzzqDuFiGLGmZYmYZKTFLDo
 VeUnYKo0K92T8bQ2aulVndYCzNtBqVyzp3q7O1SJjUiohbQ4XtbFFjlxrSi8fj9QlHmD
 AIkJKq2IenpXK6P9n1ksYQBPX8gY11f5uNtyUFGjuDnX7IXRFnttaNHvLWjLwQQIbDkZ 4A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xw0018516-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Feb 2020 11:10:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A97D100034;
 Tue,  4 Feb 2020 11:10:31 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1FB952AD9D9;
 Tue,  4 Feb 2020 11:10:31 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Tue, 4 Feb 2020 11:10:30 +0100
From: Olivier Moysan <olivier.moysan@st.com>
To: <jic23@kernel.org>, <robh+dt@kernel.org>, <olivier.moysan@st.com>
Date: Tue, 4 Feb 2020 11:10:05 +0100
Message-ID: <20200204101008.11411-2-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204101008.11411-1-olivier.moysan@st.com>
References: <20200204101008.11411-1-olivier.moysan@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-04_02:2020-02-04,
 2020-02-04 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, pmeerw@pmeerw.net,
 knaack.h@gmx.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/4] dt-bindings: iio: adc: sd modulator: add
	vref support
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

Add vref supply support to sigma delta modulator.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 .../devicetree/bindings/iio/adc/sigma-delta-modulator.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.yaml b/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.yaml
index a390343d0c2a..2afe0765e971 100644
--- a/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.yaml
@@ -8,6 +8,7 @@ title: Device-Tree bindings for sigma delta modulator
 
 maintainers:
   - Arnaud Pouliquen <arnaud.pouliquen@st.com>
+  - Olivier Moysan <olivier.moysan@st.com>
 
 properties:
   compatible:
@@ -21,6 +22,9 @@ properties:
   '#io-channel-cells':
     const: 0
 
+  vref-supply:
+    description: Phandle to the vref input analog reference voltage.
+
 required:
   - compatible
   - '#io-channel-cells'
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
