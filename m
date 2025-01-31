Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AACA240A8
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jan 2025 17:36:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 843B4C7128F;
	Fri, 31 Jan 2025 16:36:55 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FBA8C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2025 16:36:48 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-436345cc17bso17136385e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2025 08:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738341408; x=1738946208;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jtFQ9J65cFd3o5+YuJiRQk+pzjY2xY2gR0s0VLRS55E=;
 b=LD3nL4sOVa/AJnOFryGx+kn8fyqM9mzCwk7sriKvJ4OAPlUpzmPfqiXfAcjpZrLqoz
 YGFrPUAbacj971Dd5r3ojlZeOmN4XF1fyv4TM+pemvKlwZr6Kl+H5pz0m9h2CnVJ6WkF
 bbQtNRh3qjVLrsY38vhm/a0C+lIQ8TRxIUWdrd6l7bwLX6EJw//rpHQxCLprUzpWIt2c
 ud5S7hTmmimX1zENpV48NweGxNj7XvVsXAES7/PjQBvOa6uqKlTi3h1IZis3DEeXMQG9
 c6YI1tQRpoac9fl0HDl+7MkY3nYZIkq9UBsf/NaxLv6LsXjvWEloGV2glaniOEbzMzwl
 T0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738341408; x=1738946208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jtFQ9J65cFd3o5+YuJiRQk+pzjY2xY2gR0s0VLRS55E=;
 b=M0pPT+O7e/4xqyewVhJwhnFgfw0x7PLI4zsGpUvbLL0gSZRwN3sVfcsqUIokMDxb/5
 yZ3TQA4UXoMHTnhJSXuDGbagVJs3UqOC6EipDQf0N9s+f9wCH3Wx8NdN1kBGuR2SHplc
 ZgiH3/qtMo7g9kq1S+Ae5xVPavZrS6C8EyhJvWLgEHL89xC+O8dNssQYgMQMOVtGchpV
 7EMAvjlDB88ZMoS0y1WPxb3V8467XEkiy3I1czpLb/o+yahYP1/QOMtCXc+t7EdVltOE
 iqpX6eYSd71+gK0Unwjn27JWWz4lwMiJNfFLbJpBWM1o19lrWJaRx26kUi+PslgeqJhb
 Qozw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUDICX//nez0XCFeOBKf4ylOK9EUvno0ODG25YWaNGb2C6A7j9l1g0EGNE22ZE8gIwMzOCcu+/MXXqUw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyhijvMdr0RwlwcVRRk8RrjoZZpmNZnuFNKM0MO0UZbclO+ebMa
 qx3flZ1XNI25FH3ZY6vseKxAPA5o+FKpHeNBBu64VT+WCEMOGozKrFqVeRy2j5Q=
X-Gm-Gg: ASbGncu2CFoxtYCPU+1PW1KXcIpHIs5iSBvxHzliVM5A4x6Q400Su/nzi82+j4wPOz6
 GSFZ+sGoUkSi0MhC0WIV54yytL9hAa/5zUAbvWq2bzPXdEYbPtVBW3xgqr6HzFwcek2Log6drpk
 dAzE74+QdM7kQuf3m8ErUTuIH0kK1JHrRmYiEwrfvNmk0A8FSKFLcnVCUWCfHBG+ycz1xqXXjzI
 xulVrMxPPBRpqiTyIQcWAtByx42GvgFGiTXKgMDTu8PhJ9GNXaH74q8pV2D6o6PFVHS6wcokF8d
 F/2umkppRCbzqV0=
X-Google-Smtp-Source: AGHT+IF5Phsc9N8X46dajNfJWnr4UVEjpzVbx4Mq2WI4DCkq1bHDvZhiQxOuFhDTImar5RTr5xSPFA==
X-Received: by 2002:a05:6000:4008:b0:386:459e:655d with SMTP id
 ffacd0b85a97d-38c51952173mr9891268f8f.20.1738341407991; 
 Fri, 31 Jan 2025 08:36:47 -0800 (PST)
Received: from pop-os.. ([145.224.90.107]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1e8f53sm4975118f8f.100.2025.01.31.08.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 08:36:39 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: quic_jiegan@quicinc.com
Date: Fri, 31 Jan 2025 16:36:12 +0000
Message-Id: <20250131163617.1730505-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d5332d6d-237f-4b78-9eaf-2619bd97b7bd@quicinc.com>
References: <d5332d6d-237f-4b78-9eaf-2619bd97b7bd@quicinc.com>
MIME-Version: 1.0
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 quic_jinlmao@quicinc.com, alexander.shishkin@linux.intel.com,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 suzuki.poulose@arm.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, James Clark <james.clark@linaro.org>,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, quic_tingweiz@quicinc.com,
 linux-arm-kernel@lists.infradead.org, mike.leach@linaro.org
Subject: [Linux-stm32] [PATCH 0/3] coresight: Alloc trace ID after building
	the path
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

Proof of concept to support CTCU device. Applies to Jie's patchset in
the parent email. I think this would be a good simplification, it
removes some code and makes things a bit clearer, and works for both the
old and new CTCU requirements. It will require merging into the parent
patchset somehow as it undoes some of those changes.

James Clark (3):
  coresight: Don't save handle in path
  coresight: Export coresight_get_sink()
  coresight: Alloc trace ID after building the path

 drivers/hwtracing/coresight/coresight-core.c  | 107 +++++++++++++-----
 drivers/hwtracing/coresight/coresight-dummy.c |   9 +-
 drivers/hwtracing/coresight/coresight-etb10.c |   8 +-
 .../hwtracing/coresight/coresight-etm-perf.c  |  20 ++--
 drivers/hwtracing/coresight/coresight-etm.h   |   1 -
 .../coresight/coresight-etm3x-core.c          |  84 ++------------
 .../coresight/coresight-etm3x-sysfs.c         |   3 +-
 .../coresight/coresight-etm4x-core.c          |  83 ++------------
 .../coresight/coresight-etm4x-sysfs.c         |   4 +-
 drivers/hwtracing/coresight/coresight-etm4x.h |   1 -
 drivers/hwtracing/coresight/coresight-priv.h  |  17 +--
 drivers/hwtracing/coresight/coresight-stm.c   |   5 +-
 drivers/hwtracing/coresight/coresight-sysfs.c |   6 +-
 .../hwtracing/coresight/coresight-tmc-etf.c   |   9 +-
 .../hwtracing/coresight/coresight-tmc-etr.c   |  13 +--
 drivers/hwtracing/coresight/coresight-tmc.h   |   2 +-
 drivers/hwtracing/coresight/coresight-tpda.c  |   3 +-
 drivers/hwtracing/coresight/coresight-tpdm.c  |   3 +-
 drivers/hwtracing/coresight/coresight-tpiu.c  |   2 +-
 drivers/hwtracing/coresight/coresight-trbe.c  |   4 +-
 drivers/hwtracing/coresight/ultrasoc-smb.c    |   8 +-
 include/linux/coresight.h                     |  25 +++-
 22 files changed, 159 insertions(+), 258 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
