Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 476D99EE50F
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Dec 2024 12:31:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBF6CC7128A;
	Thu, 12 Dec 2024 11:31:48 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB770C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2024 11:31:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9096310408F81; Thu, 12 Dec 2024 12:31:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1734003099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0QbSLomodtXNKB8cDOH/2MSoJ6Cktb0r4jHRLsWzOts=;
 b=SFjtowlVpmvGKND9khoyTSnNS8n4mbpVDH45y4JsiKx3cudr+nM8ZVRGAoNia11+fzj/SL
 HJ0oEjXlF410ZaD2+p/HKBZRhp9ep1cMUA4TpDhjd5AjcvJu9hlZIb/9w7LpXSqq54opKe
 zKEdbU0wjqvr/OQvfFZiwQBSp+4nxp6/C3WEh+ETV0ZljfkxNhDvc/6YTB9qXmsS27HoFW
 onS68TeKgtDsDrH8AhAwUbB4Hb9nJnXW8kz97ep+y2wwEBeQMLpSVoX7wCXF/Ja3uzFYyn
 hTp+IdA0w8uVnxN4SVn2cxheRxA6NwilmdH5PMLcLbMf1krbXfw4JdsFThLI/A==
Message-ID: <51671397-3bf4-40a9-99dc-262517634109@denx.de>
Date: Thu, 12 Dec 2024 12:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20241211163457.301140-1-clement.legoffic@foss.st.com>
 <20241212102050.374501-1-clement.legoffic@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241212102050.374501-1-clement.legoffic@foss.st.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] watchdog: stm32_iwdg: fix error
 message during driver probe
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

T24gMTIvMTIvMjQgMTE6MjAgQU0sIENsw6ltZW50IExlIEdvZmZpYyB3cm90ZToKPiBUaGUgY29t
bWl0IDNhYjE2NjNhZjZjMSAoIndhdGNoZG9nOiBzdG0zMl9pd2RnOiBBZGQgcHJldGltZW91dCBz
dXBwb3J0IikKPiBpbnRyb2R1Y2VzIHRoZSBzdXBwb3J0IGZvciB0aGUgcHJlLXRpbWVvdXQgaW50
ZXJydXB0Lgo+IAo+IFRoZSBzdXBwb3J0IGZvciB0aGlzIGludGVycnVwdCBpcyBvcHRpb25hbCBi
dXQgdGhlIGRyaXZlciB1c2VzIHRoZQo+IHBsYXRmb3JtX2dldF9pcnEoKSB3aWNoIHByb2R1Y2Vz
IGFuIGVycm9yIG1lc3NhZ2UgZHVyaW5nIHRoZSBkcml2ZXIKPiBwcm9iZSBpZiB3ZSBkb24ndCBo
YXZlIGFueSBgaW50ZXJydXB0c2AgcHJvcGVydHkgaW4gdGhlIERULgo+IAo+IFVzZSB0aGUgcGxh
dGZvcm1fZ2V0X2lycV9vcHRpb25hbCgpIEFQSSB0byBnZXQgcmlkIG9mIHRoZSBlcnJvciBtZXNz
YWdlCj4gYXMgdGhpcyBwcm9wZXJ0eSBpcyBvcHRpb25hbC4KPiAKPiBGaXhlczogM2FiMTY2M2Fm
NmMxICgid2F0Y2hkb2c6IHN0bTMyX2l3ZGc6IEFkZCBwcmV0aW1lb3V0IHN1cHBvcnQiKQo+IFNp
Z25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0
LmNvbT4KUmV2aWV3ZWQtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
