Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2B6B0FC49
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 23:48:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99808C35E3F;
	Wed, 23 Jul 2025 21:48:36 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 584EDC35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 21:48:35 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-611d32903d5so3507a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 14:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753307315; x=1753912115;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=urCBknSfoBxunYc3x4TdwqCRcefY8UK7ESNufBc9V5U=;
 b=mQqzdBr0ePcDBeG+hLy2Gz48qOxDjTllldzuzk6K+p/7q1Yh/Y+4sKrrU4VFbEoRuT
 wGvzPv9u5SbwzmCT94/xkAwoSy+UtB73DiXpeUlMiPu+bi17V/vR6wjvyUjm8pJ/Hhtu
 GvedW95VIqCSeFccyvw748EQxRC9IIyAFAT40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753307315; x=1753912115;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=urCBknSfoBxunYc3x4TdwqCRcefY8UK7ESNufBc9V5U=;
 b=RpJcomeoLSx6dSbKP5c08sJ7Tw+fPB617y5ngJ9aknudegg/DK47MnXZUa0gM06P5I
 oWAUqBKI3fIlHXWh54PeNz/MFXE2a9N1Ul3HL7u5vw6OLacfaTVC73/knVhIQHImmYoF
 4yFuxcFOLNFN+WZXH2Ckzrm0TXxSNERpbopsPQ/ncNASG4etDlL0UxiMr4erDuusFcYP
 DoKKwTDJsvlk81DBoOAJa+EHd4z9E/dm/m/mxbVLwObeDLIUbVUNUuYFFntCuNJ4drZf
 2VOujjbywcQSiRGNawwfICdsbYRwfP62ZpCjkYk70iCiINHeIZk9t2rF5Ke/0wvG12y7
 97UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQLUIX4nHZBhrdvO0999iEIWXfn3Z2mOhMNmPNDF5AvjrOk5OPS7A8/jAn5fmsE80o8+2DtVLJBMt1bw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxbLPnPzZ08xnlXrQNhfnZ4S6ZWw7bK9AaLYWV3ab8t1441Jy0g
 QHPWQt6hySAG2VYVVynNtF5dfsQzVJyts9VhsQ0WItDURYQknxq4EQO3ffO4NXmklzXS93njdne
 UWw9r1HSBXfjgwgj1nVrrPbTcwuINRUhQLNnwRc4z
X-Gm-Gg: ASbGncs6M+DVugM0BwE379OTE/aYgA5QgRU+9rsLfSnyIWnSYE0989xushXR/+V55Re
 IFc1mLuSyNwYVYTFp7sDfK0Lq2Gpg6/F6U8KwZlzI97wh7rsyl/NXk/EFPa8jAIAHbUkBlHyw6A
 C3QH2+oG6+9xWUnD0ohUSdKbNCCCc9gJbwnWXE5cBHqHvNZAANwN9ohTmmibXFq3AYMehlePkDG
 VRVTAo8dXEZgCADlAyQiw9Pk9r7nclHDHOgCWG55Cms
X-Google-Smtp-Source: AGHT+IE29O588oLM6SeiuCxCPB4k1tkTOOJCtmrayG7KngivziL2hZUa8WDJp6fjlpiSMU5FMaGeqaamK89e2HKbNPg=
X-Received: by 2002:a05:6402:cbc:b0:607:d206:7657 with SMTP id
 4fb4d7f45d1cf-614c4dff31amr25156a12.2.1753307314360; Wed, 23 Jul 2025
 14:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250723-ddrperfm-upstream-v4-0-1aa53ca319f4@foss.st.com>
 <20250723-ddrperfm-upstream-v4-5-1aa53ca319f4@foss.st.com>
In-Reply-To: <20250723-ddrperfm-upstream-v4-5-1aa53ca319f4@foss.st.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 23 Jul 2025 14:48:21 -0700
X-Gm-Features: Ac12FXxzDR1_uTCXgfJ-I1tKRpXZw5fnYQthEfx3HR3N-6vAUe5POy6l3eogw2g
Message-ID: <CAODwPW_kex5Agqxg_i-XC308scEpUJU0me55G7iZ8nB9LC0acg@mail.gmail.com>
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
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
Subject: Re: [Linux-stm32] [PATCH v4 05/20] dt-bindings: memory: factorise
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

> +      Compatible strings can be either explicit vendor names and part numbers
> +      (e.g. elpida,ECB240ABACN), or generated strings of the form
> +      (lp)?ddrX-Y,Z where X, Y and Z are in lower case hexadecimal with leading
> +      zeroes and :
> +        - X is the SDRAM version (2, 3, 4, etc.)
> +        - for LPDDR :
> +          - Y is the manufacturer ID (from MR5), 2 bytes
> +          - Z is the revision ID (from MR6 and MR7), 4 bytes

It's actually one byte manufacturer, two bytes revision. The YY,ZZZZ
is supposed to represent the amount of hex digits needed.

> +        - for DDR4 with SPD, according to JEDEC SPD4.1.2.L-6 :
> +          - Y is the manufacturer ID, 2 bytes, from bytes 320 and 321
> +          - Z is the revision ID, 1 byte, from byte 349

I don't think this will identify a part unambiguously, I would expect
the DDR revision ID to be specific to the part number. (In fact, we're
also not sure whether manufacturer+revision identifies LPDDR parts
unambiguously for every vendor, we just didn't have anything more to
work with there.) I would suggest to use either `ddrX-YYYY,AAA...,ZZ`
or `ddrX-YYYY,ZZ,AAA...` (where AAA... is the part number string from
SPD 329-348 without the trailing spaces). The first version looks a
bit more natural but it might get confusing on the off chance that
someone uses a comma in a part number string.

> +      The latter form can be useful when SDRAM nodes are created at runtime by
> +      boot firmware that doesn't have access to static part number information.

nit: This text slightly doesn't make sense anymore when in the DDR
case we do actually have the part number. I guess the real thing the
bootloader wouldn't have access to is the JEDEC manufacturer ID to
name mapping.

> +      SDRAM revision ID:
> +        - LPDDR SDRAM, decoded from Mode Register 6 and 7.
> +        - DDR4 SDRAM, decoded from the SPD from bytes 349 according to
> +          JEDEC SPD4.1.2.L-6.

nit: Clarify that this is always two bytes for LPDDR and always one
byte for DDR.

> +      Density of SDRAM chip in megabits:
> +        - LPDDR SDRAM, decoded from Mode Register 8.
> +        - DDR4 SDRAM, decoded from the SPD from bytes 322 to 325 according to
> +          JEDEC SPD4.1.2.L-6.

Are these numbers correct? I downloaded SPD4.1.2.L-6 now and it looks
like 322 is manufacturing location and 323-324 are manufacturing date.
(Also, I think all of these are specific to DDR4 (and possibly 5?),
but not to earlier versions. I don't think we need to list it for
every version, but we should at least be specific what it applies to.)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
