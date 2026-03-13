Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MH8yKNjJs2kqawAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 09:24:56 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A2027F8DE
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 09:24:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2023C8F28F;
	Fri, 13 Mar 2026 08:24:55 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A30BC87ED6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 08:24:54 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4852fdb36a8so21319085e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 01:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773390294; x=1773995094;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hAFGGUj97wUgKBI4E0D3p+1miO3lf4NeLxQAlqvBWVs=;
 b=i9n4UYE8jlGHAN2XJGmigb/azQl1T0j6Uun80iKNpxlY3X8mJDiyM2SjSOPxOWpAY2
 SLHX6SbcSvzFysRjKl2J7x5bDD8HTTh1NcptPyhb9xuCqgvyerc5GeG5ice1Wc2x5RKH
 ZL+Y7QcU/scRe7b8JWHGuVXU3BuB9aPLdSMkJNuAvO5LKUpodOI2papx+J7GXtWH8F82
 DBQe69Cwl8YZcRw8I24o+WbVo9DZ8C/cxlhcEK/6Kb7Tz7cTKGo6AYjCi1dZkcn5zs6Y
 mv/qHVszJ6zNv2qz8N14+q01Z6ljSQzup/F973ugt8oS+CGUr4xaxI4xQX31U2ifBnkt
 F7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773390294; x=1773995094;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hAFGGUj97wUgKBI4E0D3p+1miO3lf4NeLxQAlqvBWVs=;
 b=fizz6h6Op5UFdtnoxU+2Ro5YhpFuJ13soq48rRzUEmw/36XU7ATPULTXNbKnhTLgC0
 t+i/yVR5pf7IYihqiXrbiEY5nieQhf/z1JtyY0Ijz4btqfwSqlLkYgAifHSTohwblj51
 GQAdLP2B0wP2m3ZunVHhvEApHCKZ0V+uP5y2fFrdvQvGBoghkCGDG957Wfm6ROfjQLBm
 BYn9408+2DDjVqR6oxr2IkhtXV75OFm2TlSEqeRvmE667iVttOqjAo5UTOuJThDxeujf
 ccil1sRQG2tWkcYN++04lFgYUqxm9z5grYT+G+013cw9lE4Clo1dpzwx1pgs7urDcXRL
 5IMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtrDLV1G0aRid6pV77fsFw+Za/1LHdsCa1zGOEJQNdn7s0Re3Frfj+HFdgWRSjV5EGfVRcv6vUHefzUA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwqU6HjRKfFp06oxuqNhi6t4O38bhvwjpfs/ytTiryk1xL9Wb9m
 krS1bYVCpZIJ0YhznZdHQpSsoF34MkkVNe3jnw5s43pEIhH19gkKf068
X-Gm-Gg: ATEYQzxEvoEfAwPJRVTy+jKkYRwe7vOHvzPvdCnNMZJnuHPEK/2/rquFKsDFGAuqZa2
 4JspngSPQw3nY4XctbyRDDxqSb1F34WE9rgBqJzK4sPMIAiNuwak4ZUe5U4f33UDjoeIl5H8636
 mz4eBRKNVQZxhDTFo+YV/DeXJPLGxubb6sDOEsEa1Anqp7/d3XZtVxQwZAoVW/nTXJ0y7xbBIBn
 gPaAkP2Lb4NsfxAUxNLxp2jD/KRuv4gBfBSZdYngzYGK+geE4OlDXT6YzMUj7jjH1kzwiHRoKq7
 bge7g/TIJ5pHUxydwoqfDlSQnpcqLT+UFDDeH2ZKCL8eJYhByt5PPOWmeyEAzJE+0Rn+o22+M3P
 cLuSnH1qHPmXbTycmNX3aZ816eG70NhATb/ePXZqS4dXRHFte4oXwLw7vze/gVr91hXolYwgBgQ
 L8qPWY/20sU1JNt24cWQCz6uLzM+tPBkDsfuoWXTj0IaTJN7WyYe/g7O+GoxRJbL0TTqwVLQZM6
 2yO6UGiRo6FV/R9naYkiT/y5ZP8tyisSCLhY5FM9HfMtPEQi3LG4EaznF5/u14iwG1wyQ==
X-Received: by 2002:a05:600c:3492:b0:483:c3f3:1dad with SMTP id
 5b1f17b1804b1-48556713589mr34343685e9.34.1773390294105; 
 Fri, 13 Mar 2026 01:24:54 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:91f5:5e00:f7a6:cd23:3f76:a7e?
 (2a01cb0891f55e00f7a6cd233f760a7e.ipv6.abo.wanadoo.fr.
 [2a01:cb08:91f5:5e00:f7a6:cd23:3f76:a7e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b65fd3dsm194645545e9.10.2026.03.13.01.24.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2026 01:24:53 -0700 (PDT)
Message-ID: <7d1c36ba-2699-4b33-8343-8e0c74fcfe59@gmail.com>
Date: Fri, 13 Mar 2026 09:24:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
References: <20260210-b4-rcc-upstream-v9-0-17ca1db7613f@gmail.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <20260210-b4-rcc-upstream-v9-0-17ca1db7613f@gmail.com>
Cc: devicetree@vger.kernel.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v9 0/3] Register the STM32MP25 RCC driver
 as an access controller.
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
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,gmail.com,foss.st.com];
	FORGED_SENDER(0.00)[legofficclement@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:gabriel.fernandez@foss.st.com,m:devicetree@vger.kernel.org,m:clement.legoffic@foss.st.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[legofficclement@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.845];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 43A2027F8DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGVsbG8sCgpPbiAyLzEwLzI2IDg6MzIgUE0sIENsw6ltZW50IExlIEdvZmZpYyB3cm90ZToKPiBU
aGUgU1RNMzJNUDI1IFJDQyBwZXJpcGhlcmFsIGFzIGFuIGFjY2VzcyBjb250cm9sbGVyIGlzIGFs
bG93ZWQgdG8ga25vdwo+IHdoZXRoZXIgdGhlIGNsb2NrcyBhcmUgc2VjdXJlZCBvciBub3QuCj4g
VGhlIFNUTTMyTVAyNSBSQ0MgcGVyaXBoZXJhbCBrbm93cyBhYm91dCB0aGUgY2xvY2sgc2VjdXJl
IGNvbmZpZ3VyYXRpb24KPiBvZiBhbGwgbm9uIFJJRi1hd2FyZSBwZXJpcGhlcmFsLgo+IEluIHBh
cmFsbGVsIGFsbCB0aGUgUklGLWF3YXJlIHBlcmlwaGVyYWwgY29uZmlndXJhdGlvbiBpbmZvcm1h
dGlvbgo+IGFyZSBrbm93biBieSB0aGUgUklGU0MgcGVyaXBoZXJhbCB3aGljaCBpcyBhbHJlYWR5
IGFuIGFjY2Vzcwo+IGNvbnRyb2xsZXIuCj4gCj4gQ2hhbmdlcyBpbiB2OToKPiAtIFJlYmFzZSBv
biB2Ni4xOS4wCj4gLSBBZGQgR2FicmllbCBGZXJuYW5kZXoncyBSZXZpZXdlZC1ieQo+IC0gTGlu
ayB0byB2ODogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDkyNC1iNC1yY2MtdXBzdHJl
YW0tdjgtMC1iMzJkNDZmNzFhMzhAZ21haWwuY29tCj4gCj4gQ2hhbmdlcyBpbiB2ODoKPiAtIFVz
ZSB1cHBlcmNhc2UgZm9yIHBlcmlwaGVyYWwgbmFtZSBpbiBjb21taXQgbWVzc2FnZQo+IC0gQWRk
IHRoZSAnI2FjY2Vzcy1jb250cm9sbGVyLWNlbGxzJyBwcm9wZXJ0eSB0byB0aGUgUkNDIGluCj4g
ICAgc3RtMzJtcDIzMS5kdHNpCj4gLSBMaW5rIHRvIHY3OiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9yLzIwMjUwOTIyLWI0LXJjYy11cHN0cmVhbS12Ny0wLTJkZmM0ZTAxOGY0MEBnbWFpbC5jb20K
PiAKPiBUaGUgdjcgaXMgYSBzdWJzZXQgb2YgdGhlIHY2IGFuZCBvdGhlciBwcmlvciB2ZXJzaW9u
cywgc3BsaXQgdG8gc2ltcGxpZnkKPiB0aGUgcmV2aWV3IGFuZCBtZXJnaW5nIHByb2Nlc3MuCj4g
Cj4gQ2hhbmdlcyBpbiB2NzoKPiAtIE5vbmUKPiAtIExpbmsgdG8gdjY6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8yMDI1MDkwOS1iNC1kZHJwZXJmbS11cHN0cmVhbS12Ni0yLWNlMDgyY2M4
MDFiNUBnbWFpbC5jb20vCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxs
ZWdvZmZpYy5jbGVtZW50QGdtYWlsLmNvbT4KPiAtLS0KPiBDbMOpbWVudCBMZSBHb2ZmaWMgKDMp
Ogo+ICAgICAgICBkdC1iaW5kaW5nczogc3RtMzI6IHN0bTMybXAyNTogYWRkIGAjYWNjZXNzLWNv
bnRyb2xsZXItY2VsbHNgIHByb3BlcnR5Cj4gICAgICAgIGNsazogc3RtMzJtcDI1OiBhZGQgZmly
ZXdhbGwgZ3JhbnRfYWNjZXNzIG9wcwo+ICAgICAgICBhcm02NDogZHRzOiBzdDogc2V0IFJDQyBh
cyBhbiBhY2Nlc3MtY29udHJvbGxlcgo+IAo+ICAgLi4uL2JpbmRpbmdzL2Nsb2NrL3N0LHN0bTMy
bXAyNS1yY2MueWFtbCAgICAgICAgICAgfCAgNyArKysrCj4gICBhcmNoL2FybTY0L2Jvb3QvZHRz
L3N0L3N0bTMybXAyMzEuZHRzaSAgICAgICAgICAgICB8ICAxICsKPiAgIGFyY2gvYXJtNjQvYm9v
dC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpICAgICAgICAgICAgIHwgIDEgKwo+ICAgZHJpdmVycy9j
bGsvc3RtMzIvY2xrLXN0bTMybXAyNS5jICAgICAgICAgICAgICAgICAgfCA0MCArKysrKysrKysr
KysrKysrKysrKystCj4gICA0IGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPiAtLS0KPiBiYXNlLWNvbW1pdDogMDVmN2U4OWFiOTczMTU2NWQ4YTYyZTNiNWQx
ZWMyMDY0ODVlZWIwYgo+IGNoYW5nZS1pZDogMjAyNTA5MTYtYjQtcmNjLXVwc3RyZWFtLThhOGVh
M2FmNmEwZAo+IHByZXJlcXVpc2l0ZS1jaGFuZ2UtaWQ6IDIwMjUwOTE2LWI0LWZpcmV3YWxsLXVw
c3RyZWFtLWRmZTg1ODhhMjFmODp2OAo+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogZTRhNzA4ZDlj
NmRmNTcyNWM5NTk4ZmJkMjE2OTYzNmU0ZTdkYzQ2Ygo+IAo+IEJlc3QgcmVnYXJkcywKPiAtLQo+
IENsw6ltZW50IExlIEdvZmZpYyA8bGVnb2ZmaWMuY2xlbWVudEBnbWFpbC5jb20+Cj4gCgpFdmVy
eXRoaW5nIHNlZW1zIGZpbmUgaGVyZSwgZG9lcyBhbnlvbmUgaXMgYWJsZSB0byB0YWtlIGl0ID8K
CkJlc3QgcmVnYXJkcywKQ2zDqW1lbnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
