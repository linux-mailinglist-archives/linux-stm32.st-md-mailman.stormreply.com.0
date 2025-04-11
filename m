Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FF1A8593E
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Apr 2025 12:16:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67B19C78F8B;
	Fri, 11 Apr 2025 10:16:51 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DEEDC78F89
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Apr 2025 10:16:50 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-22403cbb47fso18829175ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Apr 2025 03:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744366608; x=1744971408;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=El+yBbYFfa3m33PcQZ+/sv5AA9CYKsrtHMnxQf73yYk=;
 b=ybttOPOaIqs7PlG41SNjWh/zEPA02Y1gN9Dq2sntFQ8mfh2jk20xr1Z3yWqumEcdqQ
 dmqGw9ISCkFqHUHzfQubBvaNLK2mHvlzeUUnEIN70fMZnmFn1y/6V+h9YMWhnf3abWv8
 guoSoJoA0DAhEzoKLq558Fzx/KJ1O6ZTRQgb+OVPXlL0goz3f41qeU7Pdpa63RMv4HpJ
 IbYr6sko1zylKP1MImJyiwXSugITyiBcw46gl+m7mMScWajyoFtKii0huuJ9PkBQDTpB
 onLUWjIX8beui8RjB8Wa7LYXwcKdv+zmLTxCJz3y8yohZy6Tdq8eHHu1pOZljzOLKs4T
 s55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744366608; x=1744971408;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=El+yBbYFfa3m33PcQZ+/sv5AA9CYKsrtHMnxQf73yYk=;
 b=pFWdRvVyKh8YJyypwgAznNvc71SovSVT8H5x+IAxAMxdNsznF70DGjXNbVUyjqIRc1
 AZmVMzGUPMSDO0Ab2SAKC9F8QrUuUx4epxuPO1fodcFquavjWaAbfgwUPY9QJjFQ6wL1
 CC9YZdfVaEJcQX4Ork+v1t4NnGiNGcaNkin3cxTeqgWyNcRr+vBtR1QdTmGc0ejK1fOI
 poXhtAopBQ0g5UrfAs4bqLx46v6GpVyf99DxmX4U0oZTRa58mpfduSYyVoR3UOG7dT2w
 2XeE3yNF4Zae678mjjj2QpaVdn1YhzU/E+4NvetfP70p8QuD92WVwJf/PGz9fAU/XVNP
 FSEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjUxCBDauljvFKNRxlnhsXyHRzht4USzJlFG1PWkGu6dMp7emykfKvOtW9gZHHJT0aPTbhKU7lcOBp8g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw2CqGumQhuNWgzYtfWyYaJW68w+8pJFpJZd/iabIWgyLqhZcBE
 yjbPEY4tS+v9LQI9eEzgfm8Ath+jEwyD7Tdp4c0SY1aPMbERsPlee/DZZ0Zt6RKfoo2GWc0TN/m
 OdAohYtGj1AcJNo7/CuMFJLwX6zATo82w2TkbMA==
X-Gm-Gg: ASbGnctu+YcWFkRW51ScVu5kSr+BmPBg5iOaV2ZA4T+g9n3USJ+SA0K01GljrgEeNkb
 9jKu7w5o2YGDV8kwzyT8Xn9VkMrUf+AqmeWjmIJCRu+SxEMXDLKkCIZnsflnjE0BLu+Lxi82Spp
 9aDD/myq7EZn3jsThetFMpuP0=
X-Google-Smtp-Source: AGHT+IFS/a80yyyuZi5urEnORY3xQw5mQjSwHZr0ekHuMVLTC+K2x+MxrDzUzO/bjiGCm5Susl2ueRJyb258GnM4w9s=
X-Received: by 2002:a17:902:f705:b0:227:ac2a:1dd6 with SMTP id
 d9443c01a7336-22bea4c6e17mr42758175ad.24.1744366608577; Fri, 11 Apr 2025
 03:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
In-Reply-To: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 11 Apr 2025 11:16:37 +0100
X-Gm-Features: ATxdqUEraod8yrwnTn49b9tk1NYUizm-a1oIyjVCeHuX2V2MVcCKfTUobsggqZA
Message-ID: <CAJ9a7VjzxnOGNbAM974ybRAD4eXxWhr8d+UC1rEG=yMtug2XRQ@mail.gmail.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 0/5] coresight: ctcu: Enable byte-cntr
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

I can see that this patchset has fixed some of the issues raised from
v1 - using the existing file handle for read, and stopping the ETR to
read the RWP.

However the fundamental problem that it is still attempting to read
memory without stopping the ETR has not been addressed.

As mentioned in mine and Suzuki's comments for v1, this means:-

1) you cannot guarantee that the buffer has not wrapped when reading
data back, which will corrupt the trace decode process.
2) The DMA buffers are not being synchronized, so the PE could be
reading stale data rather than the new data written by the ETR.


Regards

Mike

On Thu, 10 Apr 2025 at 02:33, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
> The byte-cntr function provided by the CTCU device is used to transfer data
> from the ETR buffer to the userspace. An interrupt is tiggered if the data
> size exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions and the read function
> will read the data from the ETR buffer if the IRQ count is greater than 0.
> The read work will be conducted ASAP after the byte-cntr is started.
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
> The byte-cntr read work has integrated with the file node tmc_etr, e.g.
> /dev/tmc_etr0
> /dev/tmc_etr1
>
> There are two scenarios for the ETR file nodes with byte-cntr function:
> 1. BYTECNTRVAL register has configured -> byte-cntr read
> 2. BYTECNTRVAL register is disabled -> original behavior, flush the etr_buf
>
> We still can flush the etr buffer once after the byte-cntr function has
> triggered.
> 1. Enable byte-cntr
> 2. Byte-cntr read
> 3. Disable byte-cntr
> 4. Flush etr buffer
>
> Since the ETR operates in circular buffer mode, we cannot fully guarantee
> that no overwrites occur when the byte-cntr read function reads the data.
> The read function will read the data ASAP when the interrupt is
> triggered and we should not configure a threshold greater than the
> buffer size of the ETR buffer.
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
> Way to enable and start byte-cntr for ETR0:
> echo 0x10000 > /sys/devices/platform/soc@0/4001000.ctcu/ctcu0/byte_cntr_val
> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
> cat /dev/tmc_etr0
>
> Testing case has conducted for the byte-cntr read work:
> 1. Setting the buffer_size of the ETR as large as possile, here is for ETR0
>    echo 0x1000000 > /sys/bus/coresight/devices/tmc_etr0/buffer_size
> 2. Setting the threshold for the ETR0 to 0x10000
>    echo 0x10000 > /sys/bus/coresight/devices/ctcu0/byte_cntr_val
> 3. Enable ETR0
>    echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> 4. Enable ETM0 as source and enable byte-cntr to read data
>    echo 1 > /sys/bus/coresight/devices/etm0/enable_source;
>    cat /dev/tmc_etr0 > /tmp/file_byte_cntr.bin &
> 5. Disable ETM0
>    echo 0 > /sys/bus/coresight/devices/etm0/enable_source
> 6. Disable byte-cntr and flush the etr buffer
>    echo 0 > /sys/bus/coresight/devices/ctcu0/byte_cntr_val;
>    cat /dev/tmc_etr0 > /tmp/file_etr0.bin
>    ls -l /tmp
>
> -rw-r--r--    1 root     root      12628960 Apr 28 17:44 file_byte_cntr.bin
> -rw-r--r--    1 root     root      12669296 Apr 28 17:45 file_etr0.bin
>
> 7. Deal with the file_etr0.bin with following command:
>    dd if=/tmp/file_etr0.bin of=/tmp/file_etr0_aligned.bin bs=1
> count=12628960 skip=40336
>    ls -l /tmp
>
> -rw-r--r--    1 root     root      12628960 Apr 28 17:44 file_byte_cntr.bin
> -rw-r--r--    1 root     root      12669296 Apr 28 17:45 file_etr0.bin
> -rw-r--r--    1 root     root      12628960 Apr 28 17:49 file_etr0_aligned.bin
>
> 8. Compared file_byte_cntr.bin with file_etr0_aligned.bin and identified
> they are competely same.
>    diff file_byte_cntr.bin file_etr0_aligned.bin
>
> =======================
> Changes in V2:
> 1. Removed the independent file node /dev/byte_cntr.
> 2. Integrated the byte-cntr's file operations with current ETR file
>    node.
> 3. Optimized the driver code of the CTCU that associated with byte-cntr.
> 4. Add kernel document for the export API tmc_etr_get_rwp_offset.
> 5. Optimized the way to read the rwp_offset according to Mike's
>    suggestion.
> 6. Removed the dependency of the dts patch.
> Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/
>
> Jie Gan (5):
>   coresight: tmc: Introduce new APIs to get the RWP offset of ETR buffer
>   dt-bindings: arm: Add an interrupt property for Coresight CTCU
>   coresight: ctcu: Enable byte-cntr for TMC ETR devices
>   coresight: tmc: add functions for byte-cntr operation
>   arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
>
>  .../bindings/arm/qcom,coresight-ctcu.yaml     |  17 ++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   5 +
>  drivers/hwtracing/coresight/Makefile          |   2 +-
>  .../coresight/coresight-ctcu-byte-cntr.c      | 119 ++++++++++++
>  .../hwtracing/coresight/coresight-ctcu-core.c |  88 ++++++++-
>  drivers/hwtracing/coresight/coresight-ctcu.h  |  49 ++++-
>  .../hwtracing/coresight/coresight-tmc-core.c  |  29 ++-
>  .../hwtracing/coresight/coresight-tmc-etr.c   | 175 ++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-tmc.h   |  10 +-
>  9 files changed, 483 insertions(+), 11 deletions(-)
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
