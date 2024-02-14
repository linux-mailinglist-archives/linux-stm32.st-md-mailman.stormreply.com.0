Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 817EF854FF7
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Feb 2024 18:22:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30E17C69066;
	Wed, 14 Feb 2024 17:22:42 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD49CCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 17:22:38 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41EE8HJO022880; Wed, 14 Feb 2024 18:22:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=ZY48APo
 OUinSiSDyHIiuOBp0ZHEhVboMvxQGHJusJNU=; b=DZKWjjlgBNiZpQjEhaKAewm
 T0+DrfoD3aWOoRkuVqolEqae04RA4clXwBAPVY/qbD88nWmUN4wqKswJgBungsb/
 3WchzvnHVin76tbjJ7Gjfur2uzRCtkWXSJd9/+5jF6WCQr9L86d57Vbo0HzzPw4w
 6WBfjDSgPERFZvA1oW60jPMBM90pvq49GHCNAx+/p47hpIAbN6bpz7VgaLwndjOR
 OqNPa5phXd+7uFz16FSSy7VbElX4is1q1xz9WWNTrVShBwQi5e9F9m/0fxGsVyQp
 Jz+4/xYevKSImiQi3AD0OkPsnVyF+o+uabygAnOr61VEjOVC9pwzcdQqc/sdfzA=
 =
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w6mynnh04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Feb 2024 18:22:21 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DB25A4002D;
 Wed, 14 Feb 2024 18:22:16 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5D1B52CA54A;
 Wed, 14 Feb 2024 18:21:31 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 14 Feb
 2024 18:21:31 +0100
Received: from localhost (10.201.20.75) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 14 Feb
 2024 18:21:30 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Date: Wed, 14 Feb 2024 18:21:20 +0100
Message-ID: <20240214172127.1022199-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.75]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_10,2024-02-14_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/7] Introduction of a remoteproc tee to
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

Updates from the previous version [1]:

This version proposes another approach based on an alternate load and boot
of the coprocessor. Therefore, the constraint introduced by tee_remoteproc
is that the firmware has to be authenticated and loaded before the resource
table can be obtained.

The existing boot sequence is:

  1) Get the resource table and store it in a cache,
     calling rproc->ops->parse_fw().
  2) Parse the resource table and handle resources,
     calling rproc_handle_resources.
  3) Load the firmware, calling rproc->ops->load().
  4) Start the firmware, calling rproc->ops->start().
 
=> Steps 1 and 2 are executed in rproc_fw_boot(), while steps 3 and 4 are
   executed in rproc_start().
=> the use of rproc->ops->load() ops is mandatory

The boot sequence needed for TEE boot is:

  1) Load the firmware.
  2) Get the loaded resource, no cache.
  3) Parse the resource table and handle resources.
  4) Start the firmware.

Then the crash recovery also has to be managed.For recovery, the cache is
used to temporarily save the resource table and then reapply it on
restart:
  1) Stop the remote processor, calling rproc->ops->stop().
  2) Load the firmware, calling rproc->ops->load().
  3) Copy cached resource table.
  4) Start the remote processor, calling rproc->ops->start().

=> This sequence is also needed when TEE manages the boot of the remote
   processor.
=> The rproc->ops->load() is also used in recovery sequence.

Based on the sequences described above, the proposal is to:

- Rework tee_rproc API to better match the rproc_ops structure.
  This allows to simply map the function to implement the load ops, which
  is not optional. The tee_rproc_load_fw() is updated in consequence. 
- Remove the call of rproc_load_segments from rproc_start() to dissociate
  the load and the start. This is necessary to implement the boot sequence
  requested for the TEE remote proc support.
- Introduce an rproc_alt_fw_boot() function that is an alternative boot
  sequence, which implements the sequence requested for the TEE remoteproc
  support.


[1] https://lore.kernel.org/lkml/20240118100433.3984196-1-arnaud.pouliquen@foss.st.com/T/


Description of the feature:

This series proposes the implementation of a remoteproc tee driver to
communicate with a TEE trusted application responsible for authenticating and
loading the remoteproc firmware image in an Arm secure context.

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

No sysfs impact.the user only needs to provide the signed firmware image
instead of the ELF image.


For more information about the implementation, a presentation is available here
(note that the format of the signed image has evolved between the presentation
and the integration in OP-TEE).

https://resources.linaro.org/en/resource/6c5bGvZwUAjX56fvxthxds

Arnaud Pouliquen (7):
  remoteproc: Add TEE support
  remoteproc: Extract the firmware load from the start
  remoteproc: core: Add check on cached_table pointer
  remoteproc: core: Implement the support of an alternative boot
  dt-bindings: remoteproc: Add compatibility for TEE support
  remoteproc: stm32: Create sub-functions to request shutdown and
    release
  remoteproc: stm32: Add support of an OP-TEE TA to load the firmware

 .../bindings/remoteproc/st,stm32-rproc.yaml   |  51 ++-
 drivers/remoteproc/Kconfig                    |   9 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/remoteproc_core.c          | 109 ++++-
 drivers/remoteproc/stm32_rproc.c              | 169 ++++++--
 drivers/remoteproc/tee_remoteproc.c           | 397 ++++++++++++++++++
 include/linux/remoteproc.h                    |   2 +
 include/linux/tee_remoteproc.h                | 102 +++++
 8 files changed, 784 insertions(+), 56 deletions(-)
 create mode 100644 drivers/remoteproc/tee_remoteproc.c
 create mode 100644 include/linux/tee_remoteproc.h

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
