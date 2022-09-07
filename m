Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A688E5AFEAA
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Sep 2022 10:13:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67DB1C62D6D;
	Wed,  7 Sep 2022 08:13:46 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F6B4C03FC0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Sep 2022 08:13:45 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id bj14so5824164wrb.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Sep 2022 01:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=mbkRCkxOuTpK3rCdT2NdC/a3ZTao5Ps9WmVjhIiZvls=;
 b=sk8Pm679kCWo06LlDl21EZc/HmWpPNBEeJP8bUOaaDthi1z+mVK1yZW9dP3APJWwLK
 WQSj+BRhoPO2amfmoOEJcHDCD2Peg6PSwTivvgK+aSpO+RqG4t5t8ZTdofiUUnrgr3lL
 7AkuSuz5lV2jjMSAiqbC9Gj4Mv4NzajshOOJsI4ghnoj4Eoq9jaAVqxdwNF71jB9R28O
 YcIta9ZSV4Dd9kLdjcEviBNy44QypoTufBTizlDJoTwoTlJNJRK84vKqD05TiivJSZIj
 BPCIAcqAaABlHvQGbFlBIdfcgb/dGcagQWo9r7wd+9omVp+IRAa+cWABdErD/u8IrG3G
 TOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=mbkRCkxOuTpK3rCdT2NdC/a3ZTao5Ps9WmVjhIiZvls=;
 b=J3n7W6n7fF+5MXUou00NPdpkArHqApJwF22J79+aG6Dg8pTyObgqAv9J04Ghz+AgV7
 pBb2Re5MWoDIyxd4kTA8a05ygJSgKcUHveYQGhXMdxbL30AYBixMiFyyEUAvtYbko8Rh
 nn9lJridW3wwxhBf5bSunAtcFt4pjOVCeF6cfD0pK4rVpTkIjuAGGs6+Ca1O8ZisOMSK
 AUWse+FafM+OnJKMPaPGDtQoxLwPCgW2VQE03IT/u5f+sh/7nA80/CZHVqhQq+xJHd8v
 SXn8PXk0ywf+Y4jU2kOQXbqxXSmgp4ssg7uxPIUlcH5mTFJEkVLsj7qwLdObAxDegQKI
 Uefw==
X-Gm-Message-State: ACgBeo0f+UUR2R0x1AuGEgMJG/RTd85UFkirjTzbDAj2IjW2mh0XtTmV
 VMAEzJlBzFa3y9Un0NPo4n6Fjw==
X-Google-Smtp-Source: AA6agR4831QEpmYjEGZLA1k1jv1O4NZM4dYSRTaEMkIMcSOZBh3MF+BHVfh5m/Rh5jmx+OZnNPjTmg==
X-Received: by 2002:a5d:48c2:0:b0:228:6226:381a with SMTP id
 p2-20020a5d48c2000000b002286226381amr1239472wrs.366.1662538424970; 
 Wed, 07 Sep 2022 01:13:44 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
 by smtp.googlemail.com with ESMTPSA id
 h13-20020a5d504d000000b00228dbaea941sm5194810wrt.26.2022.09.07.01.13.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Sep 2022 01:13:44 -0700 (PDT)
Message-ID: <f467244a-64c0-a938-fd88-2f014c520956@linaro.org>
Date: Wed, 7 Sep 2022 10:13:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20220907080056.3460-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220907080056.3460-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH] clocksource/drivers/renesas-ostm:
 Add support for RZ/V2L SoC
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

T24gMDcvMDkvMjAyMiAxMDowMCwgTGFkIFByYWJoYWthciB3cm90ZToKPiBUaGUgT1NUTSBibG9j
ayBpcyBpZGVudGljYWwgb24gUmVuZXNhcyBSWi9HMkwgYW5kIFJaL1YyTCBTb0Mncywgc28gaW5z
dGVhZAo+IG9mIGFkZGluZyBkZXBlbmRlbmN5IGZvciBlYWNoIFNvQydzIGFkZCBkZXBlbmRlbmN5
IG9uIEFSQ0hfUlpHMkwuIFRoZQo+IEFSQ0hfUlpHMkwgY29uZmlnIG9wdGlvbiBpcyBhbHJlYWR5
IHNlbGVjdGVkIGJ5IEFSQ0hfUjlBMDdHMDQ0IGFuZAo+IEFSQ0hfUjlBMDdHMDU0Lgo+IAo+IFdp
dGggdGhlIGFib3ZlIGNoYW5nZSBPU1RNIHdpbGwgYmUgZW5hYmxlZCBvbiBSWi9WMkwgU29DLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5y
akBicC5yZW5lc2FzLmNvbT4KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dCtyZW5lc2FzQGdsaWRlci5iZT4KPiAtLS0KCkFwcGxpZWQsIHRoYW5rcwoKCi0tIAo8aHR0cDov
L3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9y
IEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2Vz
L0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdp
dHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
