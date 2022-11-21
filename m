Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF74632224
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 13:32:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E11BC65065;
	Mon, 21 Nov 2022 12:32:41 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D76E0C6504A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 12:32:40 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id cl5so19638858wrb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 04:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ihlezRqcITV1t5VrxWs36/KEu/R5kWIKk2jGkvvj46Q=;
 b=lQzcaMH5l0I+lGRkhWY51kvuNPkwMrle6rYkvK9vgGG0PjxuZ7UOfpDYgwSRrtIBlS
 PwiyzHFySexh9j3pbdm6QVbSdtjBvN1gHcamwOseND5bJ35IaZ7X4e3MfAnIbBBTUD8u
 blM94qRWeBDLpX/rdNDGWxtM9UUUD3YtgQkkSfbgVBk+fzHqd3D4iYLynAOePNkLmv3Z
 7SSufJT8npMq7u/VBLU4L2phNF+pNUsnQ5mNOK5A7wPA+U2THVMCB66iU0zlDPWKxhrv
 cOjgzuypq2p78E0ZZICv32HHA6kb/tFFrmQlKNEauHHtw0aurVK1dOCpXkv05/LtmEBV
 8EiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ihlezRqcITV1t5VrxWs36/KEu/R5kWIKk2jGkvvj46Q=;
 b=G7QjcIu6fAlPM2E56l2MAbqB0D3FM4WUmS4RfAccMNvKraMauyBRftvH0zPMq9pTxU
 RJn04Mivz8wvCmPFXKLdvfxSek2jg2tOv2zIh6HQovxKoHbWLlDW3rgaqGfBTJNqN3sm
 PxVKtGKZRddpceNB5mwv4AvbYOLW94EnkeDK+zYS9PHHn7kkcRSJ/ZsNTULJye1CzzvQ
 214omkv3yE77w+sMPLPy6PNDOBveH+lVYYgYCanuSKtnQFwFJEIplpP/VTyl4s4uYmlN
 H0G3ciTtnOxghwX0fXBIfjvOTuHf9EiE5bV1635HHF7K+Wuc8W0ESFr02eT93TGmP+cA
 u3fQ==
X-Gm-Message-State: ANoB5pl478/3aTbWmVYmnXx0qGS9mDTqX0TvzfvyhXqA7zTmKYYD8GVm
 CPwl3sPDmRvjuxjvVts910Y=
X-Google-Smtp-Source: AA0mqf577Y1OPlh4rlwG6Iw49Hb6fyYNvMdkAsPUPbkoFgBFS31v+A5SYUnOsRJMGzn+5OuD40OwIQ==
X-Received: by 2002:a05:6000:1b86:b0:241:9606:1123 with SMTP id
 r6-20020a0560001b8600b0024196061123mr5219385wru.537.1669033960260; 
 Mon, 21 Nov 2022 04:32:40 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a1cf60b000000b003cfbe1da539sm13487333wmc.36.2022.11.21.04.32.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 04:32:38 -0800 (PST)
Message-ID: <5b28a9b0-3c31-75bd-3161-0ff9bddf0c54@gmail.com>
Date: Mon, 21 Nov 2022 13:32:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-4-bero@baylibre.com>
 <8afd5100-9cef-50bd-2b53-e1a550973835@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <8afd5100-9cef-50bd-2b53-e1a550973835@linaro.org>
Cc: khilman@baylibre.com, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/9] dt-bindings: pinctrl: mediatek,
 mt65xx: Make pins-are-numbered optional
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiAyMS8xMS8yMDIyIDA5OjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IE9uIDIx
LzExLzIwMjIgMDI6NTQsIEJlcm5oYXJkIFJvc2Vua3LDpG56ZXIgd3JvdGU6Cj4+IERvbid0IGxp
c3QgdGhlIHBpbnMtYXJlLW51bWJlcmVkIHByb3BlcnR5IGFzIHJlcXVpcmVkCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IEJlcm5oYXJkIFJvc2Vua3LDpG56ZXIgPGJlcm9AYmF5bGlicmUuY29tPgo+PiAt
LS0KPiAKPiBBbmQgaG93IGFib3V0IG1ha2luZyB0aGVtIGRlcHJlY2F0ZWQ/IChkZXByZWNhdGVk
OiB0cnVlKQo+IAoKSSB0aGluayB0aGF0J3Mgd2Ugd2FudCB0byBkby4KClJlZ2FyZHMsCk1hdHRo
aWFzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
