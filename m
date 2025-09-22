Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 573B0B93812
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Sep 2025 00:45:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC180C3F92E;
	Mon, 22 Sep 2025 22:45:34 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F310C3089E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 22:45:33 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-4bb7209ec97so111731cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 15:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1758581132; x=1759185932;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I59lx++Tx+ZboAPSBm8Z9Aq9d7rn9DeuhAfPTw4RUyo=;
 b=kQ/vJaOI4I24ONSA+yLrhSMy/FIyyN1Rn40Bg52USbaXoxx6Q+6jBjbsg2x2l3Pw1m
 p+GogrMi9floR6oTgNT8I6T5cenVklDWdWoMqlC87AkHYiZJo1lJnYCULZ7LWShuk7mz
 u/UvLxqjVKjfBqKSeVTDMn04X+VdZdj5TcLSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758581132; x=1759185932;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I59lx++Tx+ZboAPSBm8Z9Aq9d7rn9DeuhAfPTw4RUyo=;
 b=K73jolKESKZ1OdLX5oBLpbeZhGfZcutGvPRlEtzZewYsCHLaZV3Ht453yfdgQJZrwA
 CNjYdAywEVVO7zlflEYJENFNo1rYncjBEOm5E12uStzVU6fTe7wGri10a8NtyORPDWfB
 SvLkgdmhzCSZmOHARsG2nU2/u/ywnq/4fvbf0b94lyJV1dAMG/EdiY0p3Sdc5WbiPXwB
 7TKutsMOtxhl/+OHWPh47eI3ihNWmj3w5T0GzdF3nmJ4VoH5j0xJmDj7+oo3U/VPvFeW
 tAZN6dCJ5smjRHyRiJ00sL4EQcEbhh2MTbtbhEuVBaKgUlpyH532pSp+dHUzMw/g1JHn
 Rk1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhPU+Uf1xFKC0A9IAkvQ4nMcHTC4L3pP1UtjWDETotr/RFdYHQrv7IEIIBKuNXwar0cfa2XerEqEXtJA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzuD0tX0NGNlAqTLZ+N8lF81IwMAi+8JkbAk4k1b9L3uVloj2ZH
 KOZBrJF4rmAErb/8fI62MeLnWriLFGzbCVQaUPKYgQ8YOS7g5XDmNm7du7jPPxKr4VT7028wB/o
 wup3nUWUFqm4SgLK9Bz0NwE0n8HwMxcLluevZfm9E
X-Gm-Gg: ASbGncu/jHmO7SNryd+ipA+28oCr/N4S9rgQAxhStegZXkV6nduW5p+QBz4MrXfR40l
 kUkAFYVtpG97n6se+lbiYjJfF1Cq73M0k0Y9c6sTQr3aPVVSWjZB8oHjZ1aXscWKOLMGhAwoVLH
 q3czz/SPBJzSbWO3xzqLFC58eZZIaYHxywtiqbskyWBINVNJQiuZQLLOuTSxYcyoX9zfHHqmw8C
 oWH
X-Google-Smtp-Source: AGHT+IEEHjj+wsiT1bNCpHBT5Mi+r8GATT0+bhUw8kMDnXciBxiK/CjOVLMPqzXvLsmITsSiS2BY9rY1zKy2QnMzLjo=
X-Received: by 2002:ac8:5903:0:b0:4cf:dc5c:8c76 with SMTP id
 d75a77b69052e-4d36ab2866fmr1207671cf.11.1758581132096; Mon, 22 Sep 2025
 15:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
 <20250922-b4-ddr-bindings-v7-1-b3dd20e54db6@gmail.com>
In-Reply-To: <20250922-b4-ddr-bindings-v7-1-b3dd20e54db6@gmail.com>
From: Julius Werner <jwerner@chromium.org>
Date: Mon, 22 Sep 2025 15:45:19 -0700
X-Gm-Features: AS18NWDpJeoFHhQc83aqhmhoSwFRisU770ZW4iy7Do1FLF-ntGplzcw3QSX4Lyg
Message-ID: <CAODwPW_oDTh9FdnLq7w2FPQv68ReAUUpssqEktUH5zhewbfcxg@mail.gmail.com>
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Julius Werner <jwerner@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 1/7] dt-bindings: memory: factorise
 LPDDR props into SDRAM props
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

> +      lpddrX,YY,ZZZZ or ddrX-YYYY,AAAA...,ZZ where X, Y, and Z are in lower

It looks like you accidentally changed `lpddrX-YY,ZZZZ` to `lpddrX,YY,ZZZZ`?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
