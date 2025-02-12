Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDB2A32829
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Feb 2025 15:15:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66F80C78F89;
	Wed, 12 Feb 2025 14:15:34 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D506C78034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2025 14:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1739369726; x=1739974526; i=markus.elfring@web.de;
 bh=iCWXvj2a4k/niiC9u9wcJPbUXpQIPybramZFQ8uqJqU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=bRzgpUYc5bFwukP1xFjqV0U09qF7mRfihWuRv8064J8GAYSEQ2Zmp0wEQuaWEeV7
 Sw4E/3Ix1A25Son42E1gomKlyLbm8a+DAMKVYY0eq59z66ilOAWCYTx9EeA03CYfB
 SOyG5e8S6ORZqHAYgIfh/M6Em+mE7fm5sCkUqlYSUjXR9Kb+sq3bLDZvH3eeujNtj
 pzp6Dq+/MKCd2iu5vIEdiZP87c/HrgvFbzrjTxBOq+GvM/pgcrysdV0fp/DuW+xaN
 lLRAUsRRsCGssQRu+jIp4b5BtatZtF+0hWa/sy548/IM+Whmab8O39ENBdrGaaxLH
 5PqwCIBh48bSCG0UZg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.11]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mo6Jz-1t35GP2LAB-00enKW; Wed, 12
 Feb 2025 15:15:26 +0100
Message-ID: <f06c4e1a-54ed-4f3a-9a7c-dfda31cfb74e@web.de>
Date: Wed, 12 Feb 2025 15:15:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250212021849.275-1-vulab@iscas.ac.cn>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250212021849.275-1-vulab@iscas.ac.cn>
X-Provags-ID: V03:K1:eVHoFBcXsVWoExu1oCJST499N7xA6sGYUk+9smIyUo+VAhMgItd
 XapbKlBkL+idgPAEziKIMcQ+8DPn0nPg8v8u8HUAZa5CwwxzztVuDFjX730Wlv25BXy/QZs
 XcfTz8/DiugUW02sEV2u4jEfFdvcmyQxPwPPg3iDO6azH4nXuQRLTf80D8GlqN4N3jT7eSK
 940M7jkccaQY2RwYRnYWg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3QrbsvZSHUs=;9l/kj/POfuaGbCezmxBAoK93rii
 jYtCIMX0iUkSIHCp3wZx/vllbrrhYjZhjP7jtcd06TV6IBjCFzJ2n0GRvor2AqgFRpVzVLW7w
 djxycQ9Y/m8byXzLiAPi6IldW31sp5hJ62aTvKAlWdeLFwWEn4zziy8ADZ8TO++0AP1LOLuyG
 kSqejiANytqM2nsaW0ywFivqY0aBj9QpfN0dChMWxqPd2rNd90VEROIOHTkmCxz3Kc3j7dWOk
 jMA4T1w/qQqg9IZXWyz4xBODYrQrHRdkIB3iKpLa8PxZutP84uGrJ0Fsa3qwDYiwXYcxCWCk2
 JC8W7Q1zx8xVEk2lnMT7x8SQ/tL1j/7KlRMn83+TTgt04zhAbRgJkHFaBd81QeP5uotFcWz3v
 HV8caupclOrsT8aJZ/T/m5f/RG/ifibC46o5TdtsqIToZuH+KB0pBPsagkv4sIJr4iq8VjHhq
 K8XyF3LdiPtMaFIoG7o7kaQUr0pHNIj89V4U82FNIaKbGoTEJlZHPTn4RGDpgSvQ/TavbYmfc
 76TflS/87bPL/gcp5dmWIBx70DrsoPKHvmPxP6QJjY6LR4Yn874e4raANl1wJzndWf/eoM7sx
 WY1Hhq5uyTWUFrbUKvvVgNs2RBghpbSOFOFTNVvJXdyl1KNzyExQ+X573lI/NCXBGraaCheho
 4ffL5b60QbxKvjWhgdevlKPWSArRLmaAHRsTXojKO4xdQohoAtsw2JzZRq1W1sdY2o9dMEAjv
 xfT/eAZV0lrrRBHg9VwCODH58GCdjjdsHFtEu1w9c2sZD6JZzBgrjuJauWn+9dfMGsipu9Hpv
 6IaQbP12EGVKR5h6drO4SRQM43CQERsC5Vtrp7FMEYmQEvqJsvAQM9D3Kg2AIo5xko6DxPrvP
 4fF7OIWBwq51dSkHWEQ2PW5mJIpWr6zkQ2oWYJZ6osiZT6T860wgqI29IrDL4JB76jTbkGCW6
 vVnvK4gsrIpWpmeEeAxO5CMHF/B15da6K+VWaAfoEH4GOgzQVN5C2lVi8rGXjwH2lHbZqVJ+4
 e3OC8XFuYqCnjGeTbeyoycgq81HOBfMHdlJGJo3mhP0ZP8CEND3c/aDK5mUGsSICK+90pLRro
 eRiNuhI8XDqa6jtWknBEF/tOD2hyfpvAoVJguVCPAUc90iKKVloCAv3D/Q1FXIVIEzRdE6+JL
 A6oUvisQWnUxaob5hLv6CImeKK1UW2t6BkKwUwuwvjiqwEyhpFN872UrJLJPS9g3N9vfjGunY
 D4hM0h+vZxLsLzORuDmEg03bNcJZSZKXJuS3532GnYb9ZIQ/Mbbh3fmrcEUzowd2NYAFaq8Cb
 3/0M0g2GlKXr+d0InI+h7/C58y5tJxLHFHHk7t+mnE710q4mlqlayBFuWbGhU8bRUU2F5JyQu
 2gPuPb03lpP6Lb9zIw/3hRb6rhiFyV/ImPeF7EsXejW52RxyGqSgv2zFKCGmciFFIrcTxY0lx
 AgWX0lA==
Cc: Linus Walleij <linus.walleij@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [Linux-stm32] [PATCH v2] gpio: stmpe: Check return value of
 stmpe_reg_read in stmpe_gpio_irq_sync_unlock
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

4oCmCj4gVGhpcyBwYXRjaCBhZGRzIGNoZWNrcyBmb3IgdGhlIHJldHVybiB2YWx1ZSBvZiDigKYK
ClNlZSBhbHNvOgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGlu
Zy1wYXRjaGVzLnJzdD9oPXY2LjE0LXJjMiNuOTQKCgpXb3VsZCB5b3UgbGlrZSB0byBhcHBlbmQg
cGFyZW50aGVzZXMgdG8gYW55IGZ1bmN0aW9uIG5hbWVzPwoKUmVnYXJkcywKTWFya3VzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
