Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COwUKS+i32mBXAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 16:35:27 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4927640558B
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 16:35:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF51CC8F286;
	Wed, 15 Apr 2026 14:35:26 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3B6BC01FB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2026 14:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1776263723;
 bh=WnKn70BAZ4sIf6ZszM++Jo6mlB40fmv2BMBcceSDkYQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CiU2a4LlRImsM5l+nSEb0eApmWCoCHT3iaWM5v++oJlHVdZJ14Yq0iKPj+AAo8Ec1
 z/WUs1E2sUwGuwt5MFKd6Hp6Wl7qHRLckSAKG6mNx+8q+1z616CD+WIyOY5+YPybAv
 YcHRl5SZ26CkGGotAlJE9rVWhVnf8dFirqvbzp+bTB/bViqqVLCvW5sENkkrP/17Ge
 uJ4bMQmmgUot7sTh2Dh+a7Zuly4E+TCX6OKPCHTvZUBNn5ZA9IDDDxZHO/N45m72yK
 z0UoigsfQj08VU3mrRJDtrseTZd0ZNn6vjwfEo8a3wH1VVWFUr1gDwnwjZoJ6RcxEZ
 dJ/JnSbRe6NYA==
Received: from [100.64.1.43] (unknown [100.64.1.43])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: benjamin.gaignard)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4BEE517E0610;
 Wed, 15 Apr 2026 16:35:23 +0200 (CEST)
Message-ID: <fd663d6d-2380-41f9-8d03-8f7740cbd6ce@collabora.com>
Date: Wed, 15 Apr 2026 16:35:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
 mchehab@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, heiko@sntech.de,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org
References: <20260415140420.282084-1-benjamin.gaignard@collabora.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260415140420.282084-1-benjamin.gaignard@collabora.com>
Cc: imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 0/2] media: verisilicon: Simplification
	and clean up
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[collabora.com:s=mail];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[collabora.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[collabora.com,pengutronix.de,kernel.org,nxp.com,gmail.com,sntech.de,foss.st.com,sholland.org];
	FORGED_SENDER(0.00)[benjamin.gaignard@collabora.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:nicolas.dufresne@collabora.com,m:p.zabel@pengutronix.de,m:mchehab@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:heiko@sntech.de,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:imx@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-rockchip@lists.infradead.org,m:kernel@collabora.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-media@vger.kernel.org,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.gaignard@collabora.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[collabora.com:-];
	NEURAL_HAM(-0.00)[-0.972];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 4927640558B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CkxlIDE1LzA0LzIwMjYgw6AgMTY6MDQsIEJlbmphbWluIEdhaWduYXJkIGEgw6ljcml0wqA6Cj4g
U2ltcGxpZnkgbW90aW9uIHZlY3RvcnMgYW5kIHJlZmVyZW5jZSBhbGxvY2F0aW9uIHdpdGggY29t
bW9uIGhlbHBlcnMuCj4gU2luY2UgaXQgcmVxdWlyZXMgdG8gbW92ZSBzb21lIG9mIGNvZGVjcyBz
cGVjaWZpYyBmdW5jdGlvbnMgYW5kCj4gc3RydWN0dXJlIGluIGNvZGVjcyBoZWFkZXIgZmlsZXMg
YWRkIGEgcGF0Y2ggdG8gZmluaXNoIHRoZSBjbGVhbiB1cC4KCkkgZm9yZ290IHRvIG1lbnRpb24g
dGhhdCB0aGlzIHNlcmllcyBkZXBlbmRzIG9uCmh0dHBzOi8vcGF0Y2h3b3JrLmxpbnV4dHYub3Jn
L3Byb2plY3QvbGludXgtbWVkaWEvcGF0Y2gvMjAyNjA0MTUwNzM4MDEuNTgzNjktMS1iZW5qYW1p
bi5nYWlnbmFyZEBjb2xsYWJvcmEuY29tLwoKPgo+IEJlbmphbWluIEdhaWduYXJkICgyKToKPiAg
ICBtZWRpYTogdmVyaXNpbGljb246IFNpbXBsaWZ5IG1vdGlvbiB2ZWN0b3JzIGFuZCByZmMgYnVm
ZmVycyBhbGxvY2F0aW9uCj4gICAgbWVkaWE6IHZlcmlzaWxpY29uOiBDbGVhbiB1cCBtZXNzeSBp
bmNsdWRlCj4KPiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24vaGFudHJvLmgg
ICB8ICAzMSArLQo+ICAgLi4uL21lZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRyb19hdjEu
YyAgIHwgICA3IC0KPiAgIC4uLi9tZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9fYXYx
LmggICB8IDEwMCArKystCj4gICAuLi4vcGxhdGZvcm0vdmVyaXNpbGljb24vaGFudHJvX2cxX2gy
NjRfZGVjLmMgfCAgIDEgKwo+ICAgLi4uL3ZlcmlzaWxpY29uL2hhbnRyb19nMV9tcGVnMl9kZWMu
YyAgICAgICAgIHwgICAyICstCj4gICAuLi4vcGxhdGZvcm0vdmVyaXNpbGljb24vaGFudHJvX2cx
X3ZwOF9kZWMuYyAgfCAgIDIgKy0KPiAgIC4uLi9tZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9o
YW50cm9fZzIuYyAgICB8ICAzNiAtLQo+ICAgLi4uL3BsYXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRy
b19nMl9oZXZjX2RlYy5jIHwgIDI2ICstCj4gICAuLi4vcGxhdGZvcm0vdmVyaXNpbGljb24vaGFu
dHJvX2cyX3ZwOV9kZWMuYyAgfCAgMTIgKy0KPiAgIC4uLi9tZWRpYS9wbGF0Zm9ybS92ZXJpc2ls
aWNvbi9oYW50cm9faDI2NC5jICB8ICAgMiArLQo+ICAgLi4uL21lZGlhL3BsYXRmb3JtL3Zlcmlz
aWxpY29uL2hhbnRyb19oMjY0LmggIHwgIDk4ICsrKysKPiAgIC4uLi9tZWRpYS9wbGF0Zm9ybS92
ZXJpc2lsaWNvbi9oYW50cm9faGV2Yy5jICB8ICAzNyArLQo+ICAgLi4uL21lZGlhL3BsYXRmb3Jt
L3ZlcmlzaWxpY29uL2hhbnRyb19oZXZjLmggIHwgIDgyICsrKysKPiAgIC4uLi9tZWRpYS9wbGF0
Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9faHcuaCAgICB8IDQ0NiArLS0tLS0tLS0tLS0tLS0tLS0K
PiAgIC4uLi9tZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9fbXBlZzIuYyB8ICAgMSAr
Cj4gICAuLi4vbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24vaGFudHJvX21wZWcyLmggfCAgMjcg
KysKPiAgIC4uLi9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9fcG9zdHByb2MuYyAgICB8ICAy
OSArLQo+ICAgLi4uL21lZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRyb192NGwyLmMgIHwg
MjYyICsrKysrKysrKy0KPiAgIC4uLi9tZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9f
dnA4LmMgICB8ICAgMSArCj4gICAuLi4vbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24vaGFudHJv
X3ZwOC5oICAgfCAgMjkgKysKPiAgIC4uLi9tZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50
cm9fdnA5LmggICB8IDEwNCArKysrCj4gICAuLi4vbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24v
aW14OG1fdnB1X2h3LmMgfCAgIDUgKwo+ICAgLi4uL3ZlcmlzaWxpY29uL3JvY2tjaGlwX3ZwdTJf
aHdfaDI2NF9kZWMuYyAgIHwgICAyICstCj4gICAuLi4vdmVyaXNpbGljb24vcm9ja2NoaXBfdnB1
Ml9od19tcGVnMl9kZWMuYyAgfCAgIDIgKy0KPiAgIC4uLi92ZXJpc2lsaWNvbi9yb2NrY2hpcF92
cHUyX2h3X3ZwOF9kZWMuYyAgICB8ICAgMiArLQo+ICAgLi4uL3ZlcmlzaWxpY29uL3JvY2tjaGlw
X3ZwdTk4MV9od19hdjFfZGVjLmMgIHwgIDE2ICstCj4gICAuLi4vcGxhdGZvcm0vdmVyaXNpbGlj
b24vcm9ja2NoaXBfdnB1X2h3LmMgICAgfCAgIDMgKwo+ICAgLi4uL3BsYXRmb3JtL3ZlcmlzaWxp
Y29uL3N0bTMybXAyNV92cHVfaHcuYyAgIHwgICAyICsKPiAgIC4uLi9tZWRpYS9wbGF0Zm9ybS92
ZXJpc2lsaWNvbi9zdW54aV92cHVfaHcuYyB8ICAgMSArCj4gICAyOSBmaWxlcyBjaGFuZ2VkLCA3
OTYgaW5zZXJ0aW9ucygrKSwgNTcyIGRlbGV0aW9ucygtKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24vaGFudHJvX2gyNjQuaAo+ICAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24vaGFudHJv
X2hldmMuaAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdmVy
aXNpbGljb24vaGFudHJvX21wZWcyLmgKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRyb192cDguaAo+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
