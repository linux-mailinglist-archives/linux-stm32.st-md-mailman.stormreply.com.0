Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B0AB0FC06
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 23:16:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 715A9C35E3F;
	Wed, 23 Jul 2025 21:16:21 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43399C35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 21:16:20 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5f438523d6fso1495a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 14:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753305379; x=1753910179;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yWyJDF3Q2SumP8IS31W52vFdyTdD9QP8y32xJ3aVsWU=;
 b=PKvBGC6rRLcZ5ZrM4w9HBMiS9wq+X2qPRtZhcn//AwjJcSEMYV8pp3rJa7d4Ls1685
 r4is5xhQcuodIWfN2/A+ONoOQ9r8RBMIIoanSycB9A6t8I1l/Qv/tSjc0kG8j1OkIplH
 evu6SgZt7uIwqD+MjgSJQAWx4xeEfVGrjXDzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753305379; x=1753910179;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yWyJDF3Q2SumP8IS31W52vFdyTdD9QP8y32xJ3aVsWU=;
 b=GRVD9Rc36vjaUICu26V6vuS8UTwvTKUDzyTnWoyLPp43wAq/wsIVxQwEvHuND+qqPz
 BpfxMn4LBZzuvqnO6AiMBNkYjXLuhM/0mWLB9FCyd5MzA1Zp+bBOm+C4OORRakMVy46X
 8LKRxBv4inTM3e9IB0X40j5XciKc1ICJZFkk/NaGJ/AwfdOosNiRPJOOIuQKs1WP07Dx
 CCeDt7scc/D/fcl2kGahEGNHm9mEd4nQMeuBFlHHNbCJQzptK+njejj7nPbdTlNnLf7e
 yu6agxnQnleSQ2mcIUIoBJYP+QjIaQRH72FVlGCESZXBUd1Y2nB9FUEMtgIVHUHW1Zlv
 KUew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpGyrzG+uBD8CM1juM+cPWCoQKtNnrBPSTRkhuXt03EzuL74hoeB9JK53tOU1I+BIYsmRPyVSVLWShww==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwX51UxsHNrgCGdvqV8GrauwU+B8MBMgO5Bk72HQcVP6x+4TTA8
 UNz3MLUON1z2mH059MiXWTQYyYpM7JpGoOgXFk9sJzMVVNEMKvJ4Q+u2KmXWtAPVM7F51SSjSuh
 mi66xi8L3Sb3GFMBB/f5whSRGapzb2qu+x5sbMokm
X-Gm-Gg: ASbGncs/na+bW8gyKzzk4Ml//VPa12/TVA11lffATHugq3lrKUgwJ4dkA31KmGKNj1Y
 /u2l6N/eSVUNueo3pSxGfI7c4lgkT1cjSCj4ScfVUiV1CSv9lViQzcMIpo7dvG5M3xMgPiqg1vQ
 aIhx2L9BjDLLjZb/9x2Tb6MW14sqveeVPqMZVGS1U4su1A4ZXLJbc+jc7+tMQN4v758Tpu3Aq9N
 M5MZgSZs8uScDLTAIGgjPCJv1lXt4NSRA==
X-Google-Smtp-Source: AGHT+IGkycQnfe72S9SyWbMalkjmg0I49bPxAmbp0MCvmAI2AYuaRbELjXuXnq+jCKrEmFtw1MggLjmHYfDowt+Iv2w=
X-Received: by 2002:a50:aa8a:0:b0:607:bd2:4757 with SMTP id
 4fb4d7f45d1cf-614cce2f67amr6758a12.1.1753305379189; Wed, 23 Jul 2025 14:16:19
 -0700 (PDT)
MIME-Version: 1.0
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
 <20250722-ddrperfm-upstream-v3-7-7b7a4f3dc8a0@foss.st.com>
 <20250723-zealous-turtle-of-perfection-e67aee@kuoka>
 <e9e33fc7-4705-4e6d-bd33-ce9dc1a9b94e@foss.st.com>
In-Reply-To: <e9e33fc7-4705-4e6d-bd33-ce9dc1a9b94e@foss.st.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 23 Jul 2025 14:16:05 -0700
X-Gm-Features: Ac12FXyYNcqm7jBBLCa0VFOXC51yHGdhXmCX5kALRLR-kvG2ffG7jYjz27Mm2C0
Message-ID: <CAODwPW-bwg-CD8qfP0cb58QVFLfJSqj6DhZSQuqHxsEdLz1QDA@mail.gmail.com>
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Le Goffic <legoffic.clement@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Julius Werner <jwerner@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 07/19] dt-bindings: memory: factorise
 LPDDR channel binding into memory channel
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

> I don't want anything specific so yes it could be cool to have a generic
> node name.
> "sdram-channel" is fine for me.
> @Julius what do you think about it ?
> Is your existing software generating it in the kernel ?
> I'm curious about dynamic node name generation.

I'm fine with whatever for the example here as long as the kernel does
not rely on any specific format. `sdram-channel-X` seems fine.

On our platforms we generate these dynamically in the bootloader based
on what we enumerated during memory training, so there's no kernel
code for it. If you're curious, our bootloader code generating it is
here: https://chromium.googlesource.com/chromiumos/platform/depthcharge/+/refs/heads/main/src/boot/memchipinfo.c#25
(We can update this if there's kernel consensus on a new format, but
we'll still have older platforms that keep running the old
implementation and we also want those to remain compatible with newer
versions of Linux.)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
