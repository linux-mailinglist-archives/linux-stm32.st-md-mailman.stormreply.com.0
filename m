Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F748AD40EB
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Jun 2025 19:36:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06288C36B38;
	Tue, 10 Jun 2025 17:36:44 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04267C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 17:36:41 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-ad88d77314bso1066553966b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 10:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749577001; x=1750181801;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QNLtRYl8Q0eOmLpDGjVlOH3U6XH8t2IuXLhDXftAH7c=;
 b=gNU8SLcrDb5G9Z5T7WAj1u2YPnGP3peVyYY6U1VSx7uD7xTxCxRYhMHOiAGhZBh4P+
 SIfXwFuOKlvpKcmxt3yUhiyUIkncRjXh+p5yoLlihlZ1aEexFFw36Ga9zHuhZqrK808E
 hN34uZ62IhZB9ynbBEoRbxCIQQ4y8sc6+6Lh5c3cC+j1D4JI5ZLXW/4CAiM1hMRklYPl
 9YtMIBB69pKUtbJBdqn8hX9kOd1uM3RSWhYsMIm1dIH9ttRVKmemua1kQ20JFFJDt45Z
 RVZkllJC3cttwOtxk43/19RkRewvhLYIRAMTK7L0LC4XWZHJU+jbH/mTF5IpQErgjdif
 UOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749577001; x=1750181801;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QNLtRYl8Q0eOmLpDGjVlOH3U6XH8t2IuXLhDXftAH7c=;
 b=d8hwSX4BK2gOSl7qkqdmtL99D7AO8iJBw6p20zCOGoHe4YM1TV2RD+IusLbfanYAg7
 18S9pvtNWdbD0ADvOG9CcM1zkAShkMa0CjxEK2pvLG+qmHnTlhuJnDAeceSPU6XcC5J7
 OOvYUtFPYliYE13goEfK1q8+FXhpb2iO18Pi32qZ2ynNZN6uMHhoQRbWbYO6Oh2rltUo
 tWs3CQqO83kYDVcbdX/5VMCgOb6DAxb+gcqj4Og6m0oD77Ffz/zmbdbMe6tTVr2GPRv7
 K6wNh6Fn8PiaS8wo7KBecAVpEwfXfHy/DBLQ3eQXPQ5gjfjupyy0DxpB/FDTMRKvw3s3
 ZK/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAYwZ/HebSLJsozd2kPtgU5Sl99Y3veejt8Zb/yoonnj4qKtFN3X8oT7ug9JENfFTo226XMiMGlLKfUw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyoEQSSzuhFDv/4LLK6DMjOkA+AdUyMjz1Wikf+66cLYoHun+ms
 8AboW+V1cGu6aUDWKPqdY2RrgUX9sC9t15TGzcnL4zLmTR7ji4Br3JsUUTrku83DtPuZ/uz/+Kz
 7Kc9gMNN1jrmuvAjmD+yZFC+Jho788BjIpHoBTlTBTg==
X-Gm-Gg: ASbGncssmFT2uXsvYmQChQfzNwx5Vi+J/Iuefh5IocZZUy29HApVcJwHQASdn9XOusN
 dFuWt5gjSnqRO6mK0V5x6l8WE/TEjEtqJcVO1O2R7n6G6kxY9ThkKgXJjp5JRUQnaqsaCCVNy/0
 8CczN+gWNQmG1z6cJGPRbWqPhBi11QtRut6UhSabs4BCKMfU6fJakkOdWsgThWZ9zb1XMIkMd1/
 L0iSA==
X-Google-Smtp-Source: AGHT+IGnpxZ/kYqFsSq4j6qp84vLjWxNulzEhZc0i1z/5c6tyzkSQMkPM59ws5hVqdCe/nWfEYyFEbx1JOZa0jQG5i8=
X-Received: by 2002:a17:907:948d:b0:ad2:4c38:5a22 with SMTP id
 a640c23a62f3a-ade897f338cmr25361966b.51.1749577001063; Tue, 10 Jun 2025
 10:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250603100808.1074812-1-arnaud.pouliquen@foss.st.com>
 <aEb8XbhY5dR__GM-@p14s> <7850c6f4-6a6f-4934-895d-9ec0688cda2a@foss.st.com>
In-Reply-To: <7850c6f4-6a6f-4934-895d-9ec0688cda2a@foss.st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 10 Jun 2025 11:36:30 -0600
X-Gm-Features: AX0GCFtaU9fLocUtXIXHBOEkqczV71_1sopLG6zbwgW4ITB5pILObesRDc6IzW8
Message-ID: <CANLsYky=AAnQ3P6J9E9R1=ufVKpGniiVTkfSeaq5J_7E=qN65g@mail.gmail.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 op-tee@lists.trustedfirmware.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH v16 0/6] Introduction of a
 remoteproc tee to load signed firmware
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

On Mon, 9 Jun 2025 at 10:33, Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
> Hello Mathieu,
>
> On 6/9/25 17:23, Mathieu Poirier wrote:
> > On Tue, Jun 03, 2025 at 12:08:02PM +0200, Arnaud Pouliquen wrote:
> >> Hello Bjorn and Mathieu,
> >>
> >> I am resending this series after waiting for over two months for Bjorn's
> >> feedback, despite a prior reminder.
> >>
> >> Please could you coordinate between yourselves to determine who will continue
> >> reviewing this series? It would be greatly appreciated if the review could
> >> proceed within a more reasonable timeframe.
> >>
> >> Thanks in advance and best regards,
> >> Arnaud
> >>
> >>
> >> Main updates from version V15[1]:
> >> - Removed the rproc_ops:load_fw() operation introduced in the previous version.
> >> - Returned to managing the remoteproc firmware loading in rproc_tee_parse_fw to
> >>   load and authenticate the firmware before getting the resource table.
> >> - Added spinlock and dev_link mechanisms in remoteproc TEE to better manage
> >>   bind/unbind.
> >>
> >
> > Have all pending issues been resolved or is there still questions about some
> > aspects of the design?
> >
>
> No pending issues on my side.
>
> In terms of design, I resend an equivalent of the V13 design incorporating
> Bjorn's comments on V15.
> The pending questions are:
> - is that V13/V16 is aligned with Bjorn's expectations[1].
> - are you also aligned on this design even if you proposed an alternative that
>   implemented in V14 and V15
> Few details on the V13/V16 design:
>
> The main point of discussion is the rproc_tee_parse_fw() implementation.
> In V13, this function loaded the firmware and then parses the resource table.
>
> You proposed an alternative, to add a new rproc->load ops
> in the remoteproc core instead (implemented in V14 and V15).
> Bjorn expressed concerns about this and proposed a solution that, from my
> understanding, is equivalent to the V13 implementation.
>

As far as I can tell, the only difference in this revision is the
loading of the firmware as part of rproc_tee_parse_fw().  I haven't
followed the thread but I am sure Bjorn had a good reason for that and
I am in agreement with this approach.

> Thanks,
> Arnaud
>
>
> [1] https://lkml.org/lkml/2025/3/5/906
>
> >> More details are available in each patch commit message.
> >>
> >> [1] https://lore.kernel.org/linux-remoteproc/20241128084219.2159197-7-arnaud.pouliquen@foss.st.com/T/
> >>
> >> Tested-on: commit 0ff41df1cb26 ("Linux 6.15")
> >>
> >> Description of the feature:
> >> --------------------------
> >> This series proposes the implementation of a remoteproc tee driver to
> >> communicate with a TEE trusted application responsible for authenticating
> >> and loading the remoteproc firmware image in an Arm secure context.
> >>
> >> 1) Principle:
> >>
> >> The remoteproc tee driver provides services to communicate with the OP-TEE
> >> trusted application running on the Trusted Execution Context (TEE).
> >> The trusted application in TEE manages the remote processor lifecycle:
> >>
> >> - authenticating and loading firmware images,
> >> - isolating and securing the remote processor memories,
> >> - supporting multi-firmware (e.g., TF-M + Zephyr on a Cortex-M33),
> >> - managing the start and stop of the firmware by the TEE.
> >>
> >> 2) Format of the signed image:
> >>
> >> Refer to:
> >> https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/src/remoteproc_core.c#L18-L57
> >>
> >> 3) OP-TEE trusted application API:
> >>
> >> Refer to:
> >> https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/include/ta_remoteproc.h
> >>
> >> 4) OP-TEE signature script
> >>
> >> Refer to:
> >> https://github.com/OP-TEE/optee_os/blob/master/scripts/sign_rproc_fw.py
> >>
> >> Example of usage:
> >> sign_rproc_fw.py --in <fw1.elf> --in <fw2.elf> --out <signed_fw.sign> --key ${OP-TEE_PATH}/keys/default.pem
> >>
> >>
> >> 5) Impact on User space Application
> >>
> >> No sysfs impact. The user only needs to provide the signed firmware image
> >> instead of the ELF image.
> >>
> >>
> >> For more information about the implementation, a presentation is available here
> >> (note that the format of the signed image has evolved between the presentation
> >> and the integration in OP-TEE).
> >>
> >> https://resources.linaro.org/en/resource/6c5bGvZwUAjX56fvxthxds
> >>
> >> Arnaud Pouliquen (6):
> >>   remoteproc: core: Introduce rproc_pa_to_va helper
> >>   remoteproc: Add TEE support
> >>   remoteproc: Introduce release_fw optional operation
> >>   dt-bindings: remoteproc: Add compatibility for TEE support
> >>   remoteproc: stm32: Create sub-functions to request shutdown and
> >>     release
> >>   remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
> >>
> >>  .../bindings/remoteproc/st,stm32-rproc.yaml   |  58 +-
> >>  drivers/remoteproc/Kconfig                    |  10 +
> >>  drivers/remoteproc/Makefile                   |   1 +
> >>  drivers/remoteproc/remoteproc_core.c          |  52 ++
> >>  drivers/remoteproc/remoteproc_internal.h      |   6 +
> >>  drivers/remoteproc/remoteproc_tee.c           | 619 ++++++++++++++++++
> >>  drivers/remoteproc/stm32_rproc.c              | 139 +++-
> >>  include/linux/remoteproc.h                    |   4 +
> >>  include/linux/remoteproc_tee.h                |  90 +++
> >>  9 files changed, 935 insertions(+), 44 deletions(-)
> >>  create mode 100644 drivers/remoteproc/remoteproc_tee.c
> >>  create mode 100644 include/linux/remoteproc_tee.h
> >>
> >>
> >> base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> >> --
> >> 2.25.1
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
