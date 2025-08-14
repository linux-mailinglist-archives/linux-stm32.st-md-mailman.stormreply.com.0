Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C20B269BC
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Aug 2025 16:41:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63900C35E00;
	Thu, 14 Aug 2025 14:41:38 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA1BDC36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 14:06:45 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3b9d41c1963so511642f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 07:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755180405; x=1755785205;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Qda6eKiChu1mXCojr2a5Wn7iDIeLm6m2hQhqg1Pn4sg=;
 b=VN2renEJyfSNmqk4xxmOiPEzJRlGoDD3/4L2HsWgpJtYHHuUyiTJHcLKaXjn81abzK
 mLOGfHWjuErMpAESjQk+Zfd4g9WAbt7CTpefUuN5gET1boOCDvaNhvO1jPVluzUQBVmF
 xSjJ1qIoVTIQI1zxfFEdNpeED3BuCDUJRavxLhDM8hR8V8JnYm0boOWv4Dmq7mIoKV4C
 iT+PU81kZsI9SFZz5pm4IK5H9GxOq1ZRmttH4/ftnpJzgjOflM99zMz/4hduBrQ91EF1
 V4v3UpnS9Nv4AZkq/NcC67+EC5If+1+u2yx8Hzo4iQcWZr7+78I2jZavTe+2yMNT29yp
 hwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755180405; x=1755785205;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qda6eKiChu1mXCojr2a5Wn7iDIeLm6m2hQhqg1Pn4sg=;
 b=b8zR9uxIAe6CQHucL8dcIFOLYbJCVf56O5f1FGJH5x6kyKld+NfvBiuHo3zN+l/IML
 AlTA65v8EenlMvyVrcvpln0IzmD6TWBuBVrVwEEDr9xDwiIJd/p1T6O+jVvmXmehA9wX
 SxlHAaG0O/K73jaf7JUs7M9ShzJWJv5jf5t9HVF10QYPM9XB2YAsqCPQc5NgRr7sXWrI
 uheMa1CN6v9S+KWCo4CedNLiV2SZttvsb10UvwyUu/vijP3+/52tinmVM63i7meXwTDt
 2ToAJW6X0SL522+bK3UBmjpVbckdYUN6iGR/k30BMQJoLRLxhXco2XiiukNFqihBBM74
 pOhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPHtSaggZ1XcF0YV9vQWFvANx68Ua/stDMVsALZBfX5l8tKYmpQZ8WNvrwNjzA6UfNBowlLXyV0z6ZcA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzBM7XGeDo79ZH+QjG3gE7osXQ6yS651UzE4s1gGInFyysMwOao
 uMfzvI6Beo0PSvQ+ESJFX/fnXZ/Y+ZCiNPYpZoYn2zcUV+YvRKwHZagI
X-Gm-Gg: ASbGnctlTipzF9agYcl20wU0Xr+SxfA2ptW1DQrQ8hExQZdLRreOmL/kq9hooTvvAy0
 Hl5Q8GJ10RMavVc9DyldlS7yVafnCqp2yXxg8tCzype0O+TEI7OoXwBAwR93q+JmhCMrOkXIssm
 SYKZjiKqaT4ZfHQmUdQVrgOS3COx3LbSbc8Nmr0BpNNvfmTA2wYsT9Ku/cfOqvi9LNTHdCmMngp
 WuKGXvoBuNqNn0kQnBAiImCM40rfOtC99DATFvWYfzHT9VqEq9hyezaWA7Aa+uB1Tjptt84xczL
 n3t2u73QELhjEWWqkdzbk/6jK3uSO5kDS1oanuIByFXYYh0I5daIOGNxjEehVvmgvtLBXZ2e9v2
 lHb7AmbuzTmc+xB95LtTMd+DfyZci4N8m32EDRu6DJERznxbNFEI7HjAMngXAqgLNEsNDDiVLWG
 jGe6EJ1tVJc1DeGDpcOqEbUVXT2kGJxAv6eOxAAjJ1ApFSpFiePyfSMT/KTqBV1c7w1/OB5Xeat
 wc=
X-Google-Smtp-Source: AGHT+IEnQ9do0ALLGKmunp/XJpi/t5BmL0hnvtsNOXrAxguTK/fiIMH8QwU2UzXZuUzOb9KHxDTCdQ==
X-Received: by 2002:a05:6000:2405:b0:3b9:7bf0:88e1 with SMTP id
 ffacd0b85a97d-3b9edfd55bfmr2615620f8f.56.1755180404714; 
 Thu, 14 Aug 2025 07:06:44 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:941b:4c00:f383:4db2:82a:81e9?
 (2a01cb08941b4c00f3834db2082a81e9.ipv6.abo.wanadoo.fr.
 [2a01:cb08:941b:4c00:f383:4db2:82a:81e9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e0bfc79fsm40404341f8f.56.2025.08.14.07.06.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 07:06:44 -0700 (PDT)
Message-ID: <4055d2c4-64c7-498f-8cdb-8d749d32ec68@gmail.com>
Date: Thu, 14 Aug 2025 16:06:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
To: Julius Werner <jwerner@chromium.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
 <20250728-ddrperfm-upstream-v5-5-03f1be8ad396@foss.st.com>
 <CAODwPW-FjCtPGYkNYozo0ybEjz_rVOeDqkvEPiCmQ6M2in0OeQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAODwPW-FjCtPGYkNYozo0ybEjz_rVOeDqkvEPiCmQ6M2in0OeQ@mail.gmail.com>
X-Mailman-Approved-At: Thu, 14 Aug 2025 14:41:37 +0000
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-doc@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 05/20] dt-bindings: memory: factorise
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Julius,

On 30/07/2025 20:27, Julius Werner wrote:
>> +      Compatible strings can be either explicit vendor names and part numbers
>> +      (e.g. elpida,ECB240ABACN), or generated strings of the form
>> +      lpddrX,YY,ZZZZ or ddrX-YYYY,AAAA...,ZZZZ where X, Y, A and Z are in lower
> 
> If the revision ID is only one byte for DDR, there should be only two Zs.

Indeed, will fix it here and in the dedicated field documentation below.
Wouldn't it be better to add a regex pattern for the compatible ?

> 
>> +      case hexadecimal with leading zeroes.
> 
> AAAA is not hexadecimal, it's a verbatim ASCII string (at least that's
> how I would define it, for readability).

Yes you're right. I'll add the numbers of chars it corresponds to in the 
dedicated field below also.

> 
>> +      For LPDDR and DDR SDRAM, X is the SDRAM version (2, 3, 4, etc.).
>> +      For LPDDR SDRAM:
>> +        - YY is the manufacturer ID (from MR5), 1 byte
>> +        - ZZZZ is the revision ID (from MR6 and MR7), 2 bytes
>> +      For DDR4 SDRAM with SPD, according to JEDEC SPD4.1.2.L-6 :
>> +        - YYYY is the manufacturer ID, 2 bytes, from bytes 320 and 321
>> +        - AAAA... is the part number, 20 bytes, from bytes 329 to 348
> 
> This should clarify that it is excluding trailing spaces (so only the
> significant part of those 20 bytes, since they're supposed to be
> padded with spaces at the end).

I'll add a comment about that.

> 
>> +        - Z is the revision ID, 1 byte, from byte 349
>> +      The former form is useful when the SDRAM vendor and part number are
>> +      known, such as when the SDRAM is soldered on the board.
> 
> This inversion of the statement is a bit odd? I think it's more
> important to explain why we need the latter form (or just explain
> both).

I will document both forms so.

> 
>> +      SDRAM revision ID:
>> +        - LPDDR SDRAM, decoded from Mode Register 6 and 7, always 2 bytes.
>> +        - DDR4 SDRAM, decoded from the SPD from byte 349 according to
>> +          JEDEC SPD4.1.2.L-6.
> 
> nit: Add "always one byte" for clarity and consistency with the LPDDR
> equivalent.

Ack

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
