Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIVXJroQ82kIxAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Apr 2026 10:20:10 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB8049F2CE
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Apr 2026 10:20:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B7B0C8F262;
	Thu, 30 Apr 2026 08:20:09 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1820EC01FB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2026 08:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1777537207;
 bh=CvZdTuDsOPbOOmFVZSdMX9Q+/W011Sk793y54eFmV0Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XaUMvcwjVufXn463hhg7uWcS9Rxv4Tru74bsB2yGvC44ZNYhwnpiLzll7Gb+tm6TG
 UqehcY/XL/b/r6ZKGeKJhciwp1yH/flVzYSRMTNzCW72taUSt8Ki6JokO9N1XqkCRN
 IW4WwECF47QGtHp5iU8wk8GOtZM/wUr+4lw6vHxj6KV9Euxytw/N3w5tdQZMlZXsC1
 Wv7Af0VSwdITetenf94ZVMVV0uqFFNpWhr3WCvdNDPXW8QKz2HpHfWl9sQjCZA3EOl
 jrDBSBPkekD7cfEF1pN3iXYFUYu0w9AVubP0oSDTUOA2sgKL9/QOviFMqGwZGvcadX
 zDOilydgE2mQw==
Received: from [100.64.1.43] (unknown [100.64.1.43])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: benjamin.gaignard)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7176017E1340;
 Thu, 30 Apr 2026 10:20:06 +0200 (CEST)
Message-ID: <6ff04d04-ebe8-4a57-bdc2-b98346080055@collabora.com>
Date: Thu, 30 Apr 2026 10:20:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Frank Li <Frank.li@nxp.com>
References: <20260415140420.282084-1-benjamin.gaignard@collabora.com>
 <20260415140420.282084-2-benjamin.gaignard@collabora.com>
 <aeIRWW937ev_F8zF@lizhi-Precision-Tower-5810>
 <4064d0168c3409a1e15f9c92da56cea93956b31e.camel@collabora.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <4064d0168c3409a1e15f9c92da56cea93956b31e.camel@collabora.com>
Cc: mcoquelin.stm32@gmail.com, imx@lists.linux.dev, wens@kernel.org,
 kernel@collabora.com, p.zabel@pengutronix.de, samuel@sholland.org,
 linux-sunxi@lists.linux.dev, s.hauer@pengutronix.de, jernej.skrabec@gmail.com,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-media@vger.kernel.org, kernel@pengutronix.de, mchehab@kernel.org,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, heiko@sntech.de
Subject: Re: [Linux-stm32] [PATCH v3 1/2] media: verisilicon: Simplify
 motion vectors and rfc buffers allocation
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
X-Rspamd-Queue-Id: 3BB8049F2CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[collabora.com:s=mail];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[collabora.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:nicolas.dufresne@collabora.com,m:Frank.li@nxp.com,m:mcoquelin.stm32@gmail.com,m:imx@lists.linux.dev,m:wens@kernel.org,m:kernel@collabora.com,m:p.zabel@pengutronix.de,m:samuel@sholland.org,m:linux-sunxi@lists.linux.dev,m:s.hauer@pengutronix.de,m:jernej.skrabec@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-media@vger.kernel.org,m:kernel@pengutronix.de,m:mchehab@kernel.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:heiko@sntech.de,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[benjamin.gaignard@collabora.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.gaignard@collabora.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[gmail.com,lists.linux.dev,kernel.org,collabora.com,pengutronix.de,sholland.org,vger.kernel.org,lists.infradead.org,st-md-mailman.stormreply.com,sntech.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.993];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,collabora.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]

CkxlIDI5LzA0LzIwMjYgw6AgMjA6MTEsIE5pY29sYXMgRHVmcmVzbmUgYSDDqWNyaXTCoDoKPiBI
aSBCZW5qYW1pbiwKPgo+IExlIHZlbmRyZWRpIDE3IGF2cmlsIDIwMjYgw6AgMDY6NTQgLTA0MDAs
IEZyYW5rIExpIGEgw6ljcml0wqA6Cj4+IE9uIFdlZCwgQXByIDE1LCAyMDI2IGF0IDA0OjA0OjE5
UE0gKzAyMDAsIEJlbmphbWluIEdhaWduYXJkIHdyb3RlOgo+Pj4gVW50aWwgbm93IHdlIHJlc2Vy
dmUgdGhlIHNwYWNlIG5lZWRlZCBmb3IgbW90aW9uIHZlY3RvcnMgYW5kIHJlZmVyZW5jZQo+Pj4g
ZnJhbWUgY29tcHJlc3Npb24gYXQgdGhlIGVuZCBvZiB0aGUgZnJhbWUgYnVmZmVyLgo+Pj4gRGlz
ZW50YW5nbGVtZW50IG12IGFuZCByZmMgZnJvbSBmcmFtZSBidWZmZXJzIGJ5IGFsbG9jYXRpbmcK
Pj4+IGRpc3RpbmN0IGJ1ZmZlcnMgZm9yIGVhY2ggcHVycG9zZS4KPj4+IFRoYXQgc2ltcGxpZnkg
dGhlIGNvZGUgYnkgcmVtb3ZpbmcgbG90IG9mIG9mZnNldCBjb21wdXRhdGlvbi4KPj4gQ2FuIHlv
dSB0cnkgc3BsaXQgdG8gbW9yZSBzbWFsbCBhbmQgc3RyYWlnaHQgZm9yd2FyZCBwYXRjaGVzLCBm
b3IgZXhhbXBsZQo+Pgo+PiBmb3IgZXhhbXBsZSBjcmVhdGUgcGF0Y2gganVzdCBtb3ZlIGhhbnRy
b19oMjY0X212X3NpemUoKSB0byBoZWFkZXIgZmlsZSwKPiBNYXJraW5nIHRoaXMgaGFzIENoYW5n
ZSBSZXF1ZXN0ZWQsIGFzIEkgY29tcGxldGVseSBhZ3JlZSB3aXRoIEZyYW5rIHRoYXQgYSBzcGxp
dAo+IG9mIHRoaXMgZ2lhbnQgd2lsbCBoZWxwIHByb3BlciByZXZpZXcuCgpJIHdpbGwgY3V0IHRo
ZSBzZXJpZXMgaW4gdHdvOiBvbmUgY2xlYW4gdXAgc2VyaWVzICh3aGljaCB3aWxsIGNvbWUgYWZ0
ZXIgYXYxIGxpYiBzZXJpZXMgYmVlbiBtZXJnZWQpCmFuZCBidWZmZXIgc2ltcGxpZmljYXRpb24g
cGF0Y2ggYWZ0ZXIgdGhhdC4KCkJlbmphbWluCgo+Cj4gTmljb2xhcwo+Cj4+IC4uLgo+Pj4gKysr
IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9faGV2Yy5jCj4+PiBA
QCAtNDQsMzAgKzQ0LDQ5IEBAIGRtYV9hZGRyX3QgaGFudHJvX2hldmNfZ2V0X3JlZl9idWYoc3Ry
dWN0IGhhbnRyb19jdHggKmN0eCwKPj4+ICDCoAlpbnQgaTsKPj4+Cj4+PiAgwqAJLyogRmluZCB0
aGUgcmVmZXJlbmNlIGJ1ZmZlciBpbiBhbHJlYWR5IGtub3duIG9uZXMgKi8KPj4+IC0JZm9yIChp
ID0gMDvCoCBpIDwgTlVNX1JFRl9QSUNUVVJFUzsgaSsrKSB7Cj4+PiArCWZvciAoaSA9IDA7IGkg
PCBOVU1fUkVGX1BJQ1RVUkVTOyBpKyspIHsKPj4+ICDCoAkJaWYgKGhldmNfZGVjLT5yZWZfYnVm
c19wb2NbaV0gPT0gcG9jKSB7Cj4+PiAgwqAJCQloZXZjX2RlYy0+cmVmX2J1ZnNfdXNlZCB8PSAx
IDw8IGk7Cj4+PiAgwqAJCQlyZXR1cm4gaGV2Y19kZWMtPnJlZl9idWZzW2ldLmRtYTsKPj4+ICDC
oAkJfQo+Pj4gIMKgCX0KPj4+IC0KPj4+ICDCoAlyZXR1cm4gMDsKPj4gTW92ZSB0aGlzIGNvZGUg
c3R5bGUgY2hhbmdlIHRvIG5ldyBwYXRjaGVzLgo+Pgo+PiBGcmFuawpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
