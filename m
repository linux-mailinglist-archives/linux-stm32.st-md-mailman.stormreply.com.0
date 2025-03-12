Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5751EA5DDD2
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Mar 2025 14:22:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07B37C7801E;
	Wed, 12 Mar 2025 13:22:23 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 662D3C78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Mar 2025 13:22:22 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-224019ad9edso148685765ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Mar 2025 06:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741785741; x=1742390541;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=s27ne428wojOwsBAshie2tilJzFTOz/pVe8QIl0k2F0=;
 b=dCZgNcW5xGe/1PPqnnAH6F/h5jdJja4kE/QYeala6IFrsLRyJP/pm3LeJrr7h5gxEj
 tzVV/1SgNkkMusovHdFzqGO+5TecrR6DgAlFCAcY4l1bDc3X/FXoYllFypE49d02obxK
 Z1Htnw7p8iESEYhaIc004Q7ZAXnaR8TvGscXJqSuqVZvw3YJQnsWstyo6qvo8bsFb+t5
 wFjup1EdhS5U6vGALE5flfnrbxK/yjf2/3dekkgoQAzMNDIVAswcN22Pc8pzEH+HxejE
 Aezh6VM7E/2VcSU8EboRgINgWTgTgdvSvBlqeCnUHMuiMi5eAdUdKz/spRiFOm2fdKe4
 eEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741785741; x=1742390541;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s27ne428wojOwsBAshie2tilJzFTOz/pVe8QIl0k2F0=;
 b=Vu7y0uaVX/fn6cOlzP71LXfc3Tn+Wvt9062kA/e3liil6MZijNU+7YHPNFK2GUvdlJ
 EBsnNjHhPD2s2lpkubbg11d4iYlWTjLlzI+vCvR9N9jXvDup1v5ux5emE5OcCnCdUE09
 mLQwOBtzXRzXv3vFm0R53AUxadFzdqb1+pQ0VupzX29Gy985p+6ib8SMbgrE0y1ahwJn
 qy3N2RyLd2Ac5kcke0vY5DN2r5z5yk6Mva4xB/vh/co4BSKTsyd6VRh6mcbVmaOC4uT2
 jhvEt/kE4dbnGYZcSjULhgiowVZB3JXzqFR4V3ys5FDakdif3v30+akCS0A1flMYjOKh
 rmtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkQvAg7kThHwc+MHNb7wczs/45mvU1BmXRZ2LpNDXWAuiqUYkKvTcOy4ZllaiwFejaLJNtuKuqUF4Q8A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwNIia46HxAyYTcotIcmGvqU46AETnIRDN/QQSnMDxF54gE5eiA
 GhqI/OWTth3kne8lFaYwwQ2iaREr8mJs+QK83cgffY5l+pBmvs7x31dTeR5VILkSHUzmQJYXxGL
 GkC5Ht+g0l6v1Y9l6/5norO7gUEodKSklj8Wqxw==
X-Gm-Gg: ASbGnctOdqDgKTjUgg848Vm6R+/0DUhuwfDTALzU5x4EnzDHGeDl/YIhZVki4mzWSgB
 Fk0Mxr8xXF/U7Zx4hoCes2MxE5ZnLs6M/EXN+LlYWurLcAFJMaG+xkIUHt4zl73DFE49mdeT34q
 a1vV2YklIbotoaOAh5OdEfm900T0o14k/dnEcz0A==
X-Google-Smtp-Source: AGHT+IGmt/3UktMaOMFJgApftv3nZ067gpwV3LHvs4wr2QCvCVRTWlevRuRQpnJ3GdbEdKToZ/jiLjTzfEOKYcYZ6Lk=
X-Received: by 2002:a05:6a00:987:b0:736:4830:68a6 with SMTP id
 d2e1a72fcca58-736aa9b3cb0mr30689940b3a.4.1741785740656; Wed, 12 Mar 2025
 06:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250310090407.2069489-1-quic_jiegan@quicinc.com>
In-Reply-To: <20250310090407.2069489-1-quic_jiegan@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 12 Mar 2025 13:22:09 +0000
X-Gm-Features: AQ5f1JoVaTUjPnEeh2tsJVsCs5mqAeippvAwDr6IKbNgE69l9whq43Fk1D-kCtg
Message-ID: <CAJ9a7Vj=Ni_o94u1B+oouv0GD5DVmST=N31-hsN=SPSbaoqO_Q@mail.gmail.com>
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jinlong Mao <quic_jinlmao@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, James Clark <james.clark@linaro.org>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 coresight@lists.linaro.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 0/4] coresight: ctcu: Enable byte-cntr
	function for TMC ETR
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

Hi,

On Mon, 10 Mar 2025 at 09:05, Jie Gan <quic_jiegan@quicinc.com> wrote:
>
> From: Jie Gan <jie.gan@oss.qualcomm.com>
>
> The byte-cntr function provided by the CTCU device is used to transfer data
> from the ETR buffer to the userspace. An interrupt is tiggered if the data
> size exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions and the read function
> will read the data from the ETR buffer if the IRQ count is greater than 0.
> Each successful read process will decrement the IRQ count by 1.
>
> The byte cntr function will start when the device node is opened for reading,
> and the IRQ count will reset when the byte cntr function has stopped. When
> the file node is opened, the w_offset of the ETR buffer will be read and
> stored in byte_cntr_data, serving as the original r_offset (indicating
> where reading starts) for the byte counter function.
>
> The work queue for the read operation will wake up once when ETR is stopped,
> ensuring that the remaining data in the ETR buffer has been flushed based on
> the w_offset read at the time of stopping.
>
> The following shell commands write threshold to BYTECNTRVAL registers.
>
> Only enable byte-cntr for ETR0:
> echo 0x10000 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val
>
> Enable byte-cntr for both ETR0 and ETR1(support both hex and decimal values):
> echo 0x10000 4096 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val
>
> Setting the BYTECNTRVAL registers to 0 disables the byte-cntr function.
> Disable byte-cntr for ETR0:
> echo 0 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val
>
> Disable byte-cntr for both ETR0 and ETR1:
> echo 0 0 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val
>
> There is a minimum threshold to prevent generating too many interrupts.
> The minimum threshold is 4096 bytes. The write process will fail if user try
> to set the BYTECNTRVAL registers to a value less than 4096 bytes(except
> for 0).
>
> Finally, the user can read data from the ETR buffer through the byte-cntr file
> nodes located under /dev, for example reads data from the ETR0 buffer:
> cat /dev/byte-cntr0
>
> Way to enable and start byte-cntr for ETR0:
> echo 0x10000 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val
> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
> cat /dev/byte-cntr0
>

There is a significant issue with attempting to drain an ETR buffer
while it is live in the way you appear to be doing.

You have no way of knowing if the TMC hardware write pointer wraps and
overtakes the point where you are currently reading. This could cause
data corruption as TMC writes as you are reading, or contention for
the buffer that affects the TMC write.

Even if those two events do not occur, then the trace capture sequence
is corrupted.

Take a simple example - suppose we split the buffer into 4 blocks of
trace, which are filled by the ETR

buffer = 1, 2, 3, 4

Now you suppose you have read 1 & 2 into your userspace buffer / file.

file = 1, 2

If there is now some system event that prevents your userspace code
from running for a while, then it is possible that the ETR continues,
wraps and the buffer is now

buffer = 5, 6, 7, 4

Your next two reads will be 7, 4

file = 1, 2, 7, 4

This trace is now corrupt and will cause decode errors. There is no
way for the decoder to determine that the interface between blocks 2 &
7 is not correct. If you are fortunate then this issue will cause an
actual explicit decode error, if you are less fortunate then decode
will continue but in fact be inaccurate, with no obvious way to detect
the inaccuracy.

We encountered this problem early in the development of the perf data
collection. Even though perf was stopping the trace to copy the
hardware buffer, it would concatenate unrelated trace blocks into the
perf userspace buffer, which initially caused decoding errors. This is
now mitigated in perf by marking boundaries and recording indexes of
the boundaries, so the tool can reset the decoder at the start of non
contiguous blocks.

If you do not stop the TMC when draining the ETR buffer, you have no
way of determining if this has occurred.

Clearly using large buffers, split into smaller blocks can mitigate
the possibility of a wrap in this way - but never eliminate it,
especially given the extreme rate that trace data can be generated.

Regards

Mike


> Jie Gan (4):
>   coresight: tmc: Introduce new APIs to get the RWP offset of ETR buffer
>   dt-bindings: arm: Add an interrupt property for Coresight CTCU
>   coresight: ctcu: Enable byte-cntr for TMC ETR devices
>   arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
>
>  .../bindings/arm/qcom,coresight-ctcu.yaml     |  17 +
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   5 +
>  drivers/hwtracing/coresight/Makefile          |   2 +-
>  .../coresight/coresight-ctcu-byte-cntr.c      | 339 ++++++++++++++++++
>  .../hwtracing/coresight/coresight-ctcu-core.c |  96 ++++-
>  drivers/hwtracing/coresight/coresight-ctcu.h  |  59 ++-
>  .../hwtracing/coresight/coresight-tmc-etr.c   |  45 ++-
>  drivers/hwtracing/coresight/coresight-tmc.h   |   3 +
>  8 files changed, 556 insertions(+), 10 deletions(-)
>  create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
>
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
