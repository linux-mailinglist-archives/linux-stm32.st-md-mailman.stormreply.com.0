Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 792B2992D0D
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 15:21:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9252C7802D;
	Mon,  7 Oct 2024 13:21:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D779C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2024 13:21:25 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497BJ1Bp022075;
 Mon, 7 Oct 2024 15:21:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=o3k75qDX65HAMePjIurSXe
 jJkiprmtMkSEBZxXl7gk4=; b=ByJBoNbiC81vHSeEbQZuPhG4V9O/UzA4bQq2Gt
 ip0cqGMEIkBOxFyqL37nhftYr8UvLXufHcucoM6D4m7ZVbw8lLvApR+OTobhKphe
 uSK5Lpm0yfgo9euLscf0UhhE3ZC17PjnuabiaK6qzIknHm3UVKyVQitT4IfuMa94
 Jq2Zg/bzsV5q7OjfLzdlXm4zyXVI6pOYR+ACiK0m8AwMJs8JrVmyfIIWgA+QRKe2
 LqikAYoxxGSzCRzIiOboSoJfFUTCTDNpEq7k3bWPOJbz8tWCp75DTWKLTyEo670p
 Ou17h8qpGurwHo49Hq0E2X+H9PpuIDbQafoTqVcYyXYDP23g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 423f10pc4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Oct 2024 15:21:04 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9559240044;
 Mon,  7 Oct 2024 15:19:36 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3740B269E13;
 Mon,  7 Oct 2024 15:16:41 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 7 Oct
 2024 15:16:41 +0200
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 7 Oct
 2024 15:16:40 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Date: Mon, 7 Oct 2024 15:16:13 +0200
Message-ID: <20241007131620.2090104-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.121]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v10 0/7] Introduction of a remoteproc tee to
	load signed firmware
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

Main updates from version V9[1]:

- Introduce release_fw remoteproc ops to avoid direct call of
  tee_rproc_release_fw() in remoteproc_core.c:
  - allow to remove link between remoteproc and remoteproc_tee
  - allow to build the remoteproc_tee as a module

[1] https://lore.kernel.org/linux-arm-kernel/ZuMIEp4cVrp1hWa7@p14s/T/

Tested-on: commit 9852d85ec9d4 ("Linux 6.12-rc1")

Description of the feature:
--------------------------
This series proposes the implementation of a remoteproc tee driver to
communicate with a TEE trusted application responsible for authenticating
and loading the remoteproc firmware image in an Arm secure context.

1) Principle:

The remoteproc tee driver provides services to communicate with the OP-TEE
trusted application running on the Trusted Execution Context (TEE).
The trusted application in TEE manages the remote processor lifecycle:

- authenticating and loading firmware images,
- isolating and securing the remote processor memories,
- supporting multi-firmware (e.g., TF-M + Zephyr on a Cortex-M33),
- managing the start and stop of the firmware by the TEE.

2) Format of the signed image:

Refer to:
https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/src/remoteproc_core.c#L18-L57

3) OP-TEE trusted application API:

Refer to:
https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/include/ta_remoteproc.h

4) OP-TEE signature script

Refer to:
https://github.com/OP-TEE/optee_os/blob/master/scripts/sign_rproc_fw.py

Example of usage:
sign_rproc_fw.py --in <fw1.elf> --in <fw2.elf> --out <signed_fw.sign> --key ${OP-TEE_PATH}/keys/default.pem


5) Impact on User space Application

No sysfs impact. The user only needs to provide the signed firmware image
instead of the ELF image.


For more information about the implementation, a presentation is available here
(note that the format of the signed image has evolved between the presentation
and the integration in OP-TEE).

https://resources.linaro.org/en/resource/6c5bGvZwUAjX56fvxthxds

Arnaud Pouliquen (7):
  remoteproc: core: Introduce rproc_pa_to_va helper
  remoteproc: Add TEE support
  remoteproc: core: Refactor resource table cleanup into
    rproc_release_fw
  remoteproc: Introduce release_fw optional operation
  dt-bindings: remoteproc: Add compatibility for TEE support
  remoteproc: stm32: Create sub-functions to request shutdown and
    release
  remoteproc: stm32: Add support of an OP-TEE TA to load the firmware

 .../bindings/remoteproc/st,stm32-rproc.yaml   |  58 +-
 drivers/remoteproc/Kconfig                    |  11 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/remoteproc_core.c          |  72 ++-
 drivers/remoteproc/remoteproc_tee.c           | 506 ++++++++++++++++++
 drivers/remoteproc/stm32_rproc.c              | 145 +++--
 include/linux/remoteproc.h                    |   8 +
 include/linux/remoteproc_tee.h                | 107 ++++
 8 files changed, 853 insertions(+), 55 deletions(-)
 create mode 100644 drivers/remoteproc/remoteproc_tee.c
 create mode 100644 include/linux/remoteproc_tee.h


base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
