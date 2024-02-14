Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE228546C7
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Feb 2024 11:02:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1973C57194;
	Wed, 14 Feb 2024 10:02:44 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E13A3C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 10:02:42 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-55c2cf644f3so7066078a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 02:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707904962; x=1708509762;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3bMW9whpBA0jL3HiuL3tccPcVAuuxpNXPVuN6B+u2gg=;
 b=DkP1AeV3D9goX5BkKZJzSOnQ0sGTcWz/Zh2/vMTyBHlcDWA1AK7iYdCvGEGGkcx4YO
 3qQAHodCXkW9Ft1ubB9cN0FGiwDFa92XCcmEBw3i5O+sA/G1D2GAQlqlUvurJb/xKQCb
 yiTRirbdglqCWe+XlZv40AxSuPpdrgdvJEtX/MXNvPRgcubFT5PQaq4f5Wdtq0uk1liY
 ONCwre0YIj0PGMHcTVbba/FOMIICPNrJP7gSmzNTLquRkfGyFpqv7sVEAro+L/ficcwm
 27COsTIUqipGIILwgzqiL9YkPd29FnwdVVmbI9qCxCB5MkM5/z2Of6otZ21xOxGpsZIe
 wUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707904962; x=1708509762;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3bMW9whpBA0jL3HiuL3tccPcVAuuxpNXPVuN6B+u2gg=;
 b=xNGk7z0vAz/2OKgvthRruLwQwpkDJxHsz+MKmFQN5+htk8cvLhcXNSY7DvQ7c+LAk0
 T9D7dtEEqIhlTzN1d2Kff9PxFe2qZ/VqB40UqxGdBf8BVi/qSDo4KgIIPi/ovTWr3Alt
 1ZVq3lh/mD3p6E6UCUTXJwdI3c9Qpg8kEyHvoBdSuo0OqlmAGMkTmrNvO+6JOsJTTFnx
 rA7iSvAiIls7O43VENATmcce8yFBuFfyuzODzRyrL7NXSwISkguEJoTpLzvtWv1Bk4QJ
 blJDpsP+R5K7BaCt09MMBAjv40saItYKiC/UOxad9QZ5Hd2wS5mYYZKzLIxd49qwrC/I
 qKHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFEP8WJoZ2MIJrfj6tUluLkO2pOndRJWapLYGy6NWNRsb/X/Dfo7KSw1klRh2M2vtlxcb+I6ePSedtSq1+WDoAzC3oaGtxZGpke7L2htPbByTdpHjd7Ou9
X-Gm-Message-State: AOJu0Yy4xY+0bGNzNCkSVY7PxSoQSbKtDQ9lOpoeQZKR9PURrJ/eW/WU
 RbBKQLuAy1bTcrh5Gn198jKxxHpCwOlVXQ/9nij94QcEuv3FIM/SxLNNMMpGN8c=
X-Google-Smtp-Source: AGHT+IHNVysDTvrlpcCZDo0fkXx0/f/34mP+7CCFE+pH3BouUA6vCsnowXjEfoeQZZOjgW0VU98yIg==
X-Received: by 2002:a17:906:378a:b0:a3d:1ca9:b994 with SMTP id
 n10-20020a170906378a00b00a3d1ca9b994mr1336086ejc.33.1707904962270; 
 Wed, 14 Feb 2024 02:02:42 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW8vaf5LHXA17YCCPIKcCCtlN1JISNK+L+VrIGFWTWtREpE1AommHGZJDnPVDiyqv5Kb3Yot2I0tQMagrYNam/8/G1wb/LJQvRe7L+8jidwhLyIZLCQVvqF61FOsGBALdfbuybfh96uQ0O8DdqzPj++WYaJYxVcDNGiiIWzCHqzwRPG0esmoeeKjcnwxpub+78fyDCH5C1za7lKiNo/wLYhTWB7TMIS89U+ZH2yoA0naIxu2VBihinXMTW1ulQ3/vBQ9GtBRNsipahtPye1hljmvrCfPLaQRHZloR87PxaIbaqz/iw715ueVl/uyKpO/xlITCbHZ//w0q7f35j/3UPxcl+0cKzt423t0OxTNavA+Q6y7bagpiTRrII=
Received: from [192.168.0.22] ([78.10.207.130])
 by smtp.gmail.com with ESMTPSA id
 wp14-20020a170907060e00b00a3d36da3a57sm589083ejb.7.2024.02.14.02.02.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 02:02:41 -0800 (PST)
Message-ID: <ff61656d-e4a8-4561-a3ba-f34abd1c6ce4@linaro.org>
Date: Wed, 14 Feb 2024 11:02:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
 <fbaad3c7-13b7-41a2-a8f6-7036ec1ca2fe@linaro.org>
 <9f20563b-bef1-41d0-a1ba-fefeabed2e09@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <9f20563b-bef1-41d0-a1ba-fefeabed2e09@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 00/12] Add MP25 FMC2 support
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

On 13/02/2024 13:09, Christophe Kerello wrote:
> 
> 
> On 2/13/24 08:34, Krzysztof Kozlowski wrote:
>> On 12/02/2024 18:48, Christophe Kerello wrote:
>>> Add MP25 SOC support in stm32_fmc2 drivers:
>>>   - Update stm32-fmc2-ebi driver to support FMC2 revision 2 and MP25 SOC.
>>>   - Update stm32_fmc2_nand driver to support FMC2 revision 2 and MP25 SOC
>>
>> Why do you combine memory controller driver and NAND in one patchset if
>> there is no dependency? On any further submissions, please split
>> independent works.
> 
> Hi Krzysztof,
> 
> NAND driver patch 11 refers to the compatible described for the memory

Eh, it shouldn't really. This does not scale - you will keep growing
that 'if' clause? And other drivers should not include other device
compatibles.

But anyway that's not a real subsystem dependency. Just mention in patch
changelog (so ---) that compatible is documented somewhere at URL xyz.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
