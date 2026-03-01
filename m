Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id h1BsLufVo2mdPAUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 07:00:07 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F5D1CE96C
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 07:00:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE0DEC030D6;
	Sun,  1 Mar 2026 06:00:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A692C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Mar 2026 06:00:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2A59A4402E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Mar 2026 06:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07124C4AF09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Mar 2026 06:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772344804;
 bh=QKni47SVW9Uu35RdotBA7722dJSKwDszVsr/Cmo+eIU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UQ5nOPbvJlle9K2ewrCfaXDlMF3/CnrPh10KwTwRpi2D0LMPy+je0uCUAsvXqqNix
 lNx1yibvd0/qry8SfG6cxIc92vbq+vTTo2BsKc9Ni21+ueStrli0CqoT2x3vO7wv4z
 xZJQkCuee+gJYzc0nQQv5BImFGv0K7nVa78wqZ/ybG0/LD5jADhMXHodNnFsDMNM3I
 qTGGD6i7GgbJVwIk7GAfN/1gtMF1ylZSJ44hKqogooCFEMOVpChR5774HprQPfjnas
 WMpL/F/d6uJ59bZHAbJdiPXBeJTcH9Vz88oy9mhGxgLFgb0FFQAWDBV82LiWc+ANR3
 kw+sJEtg4zm3w==
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-65b9d8d6b7dso5547673a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Feb 2026 22:00:03 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWL5GsayC7ne2vqEimHLWRRCACB0wj6uAAdkQlp9Kt5Rm1WYaDtsSWNcdxRDbGDLBe0mY7GKZ4QMUhJcA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw3iKq/oPhqn8t5YzaDXaYwZ5Wq9E7+vceeY9p0G9JdzbPzVZTP
 5QKKh4xVw0wV6/f5oLzNb514KzFMe1fZEH/1oAzX6PX3s40gvba+VC3F6hbYxxhlUPyY8Ivr1pd
 YW0qDIeAT5mb/HFO0rmXACZgf7RoYhOU=
X-Received: by 2002:a05:6402:42c4:b0:65b:ec2d:e60d with SMTP id
 4fb4d7f45d1cf-65fde2d08c7mr5450438a12.32.1772344802355; Sat, 28 Feb 2026
 22:00:02 -0800 (PST)
MIME-Version: 1.0
References: <20260301012606.1683431-1-sashal@kernel.org>
In-Reply-To: <20260301012606.1683431-1-sashal@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 1 Mar 2026 13:59:51 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7QMmww2E2yZECuW=La0i3s1nKbbQvpODgPzrPci3f0HQ@mail.gmail.com>
X-Gm-Features: AaiRm50WuaIawTrIMUAzic5HCfeMGfAec2UkDWc3Lhbmb5tQfUpf37UwpYVyxss
Message-ID: <CAAhV-H7QMmww2E2yZECuW=La0i3s1nKbbQvpODgPzrPci3f0HQ@mail.gmail.com>
To: Sasha Levin <sashal@kernel.org>
Cc: netdev@vger.kernel.org, stable@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Hongliang Wang <wanghongliang@loongson.cn>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [Linux-stm32] FAILED: Patch "net: stmmac: dwmac-loongson: Set
 clk_csr_i to 100-150MHz" failed to apply to 6.12-stable tree
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[chenhuacai@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sashal@kernel.org,m:netdev@vger.kernel.org,m:stable@vger.kernel.org,m:kuba@kernel.org,m:wanghongliang@loongson.cn,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:chenhuacai@loongson.cn,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chenhuacai@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,loongson.cn:email,msgid.link:url]
X-Rspamd-Queue-Id: 40F5D1CE96C
X-Rspamd-Action: no action

SGksIFNhc2hhLAoKT24gU3VuLCBNYXIgMSwgMjAyNiBhdCA5OjI24oCvQU0gU2FzaGEgTGV2aW4g
PHNhc2hhbEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IFRoZSBwYXRjaCBiZWxvdyBkb2VzIG5vdCBh
cHBseSB0byB0aGUgNi4xMi1zdGFibGUgdHJlZS4KPiBJZiBzb21lb25lIHdhbnRzIGl0IGFwcGxp
ZWQgdGhlcmUsIG9yIHRvIGFueSBvdGhlciBzdGFibGUgb3IgbG9uZ3Rlcm0KPiB0cmVlLCB0aGVu
IHBsZWFzZSBlbWFpbCB0aGUgYmFja3BvcnQsIGluY2x1ZGluZyB0aGUgb3JpZ2luYWwgZ2l0IGNv
bW1pdAo+IGlkIHRvIDxzdGFibGVAdmdlci5rZXJuZWwub3JnPi4KSSBoYXZlIGFscmVhZHkgc3Vi
bWl0IGEgcGF0Y2ggZm9yIDYuMTIgc29tZSBkYXlzIGFnbzoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbG9vbmdhcmNoLzIwMjYwMjE4MTIxMjE5LjI1NDUxMDctMS1jaGVuaHVhY2FpQGxvb25nc29u
LmNuL1QvI3UKCkh1YWNhaQoKPgo+IFRoYW5rcywKPiBTYXNoYQo+Cj4gLS0tLS0tLS0tLS0tLS0t
LS0tIG9yaWdpbmFsIGNvbW1pdCBpbiBMaW51cydzIHRyZWUgLS0tLS0tLS0tLS0tLS0tLS0tCj4K
PiBGcm9tIGUxYWE1ZWY4OTJmYjRmYTkwMTRhMjVlODdiNjRiOTczNDc5MTlkMzcgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCj4gRnJvbTogSHVhY2FpIENoZW4gPGNoZW5odWFjYWlAbG9vbmdzb24u
Y24+Cj4gRGF0ZTogVHVlLCAzIEZlYiAyMDI2IDE0OjI5OjAxICswODAwCj4gU3ViamVjdDogW1BB
VENIXSBuZXQ6IHN0bW1hYzogZHdtYWMtbG9vbmdzb246IFNldCBjbGtfY3NyX2kgdG8gMTAwLTE1
ME1Iego+Cj4gQ3VycmVudCBjbGtfY3NyX2kgc2V0dGluZyBvZiBMb29uZ3NvbiBTVE1NQUMgKGlu
Y2x1ZGluZyBMUzdBMTAwMC8yMDAwCj4gYW5kIExTMksxMDAwLzIwMDAvMzAwMCkgYXJlIGNvcHkg
JiBwYXN0ZSBmcm9tIG90aGVyIGRyaXZlcnMuIEluIGZhY3QsCj4gTG9vbmdzb24gU1RNTUFDIHVz
ZSAxMjVNSHogY2xvY2tzIGFuZCBuZWVkIDYyIGZyZXEgZGl2aXNpb24gdG8gd2l0aGluCj4gMi41
TUh6LCBtZWV0aW5nIG1vc3QgUEhZIE1EQyByZXF1aXJlbWVudC4gU28gZml4IGJ5IHNldHRpbmcg
Y2xrX2Nzcl9pCj4gdG8gMTAwLTE1ME1Ieiwgb3RoZXJ3aXNlIHNvbWUgUEhZcyBtYXkgbGluayBm
YWlsLgo+Cj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBGaXhlczogMzBiYmE2OWQ3ZGI0
MGU3ICgic3RtbWFjOiBwY2k6IEFkZCBkd21hYyBzdXBwb3J0IGZvciBMb29uZ3NvbiIpCj4gU2ln
bmVkLW9mZi1ieTogSG9uZ2xpYW5nIFdhbmcgPHdhbmdob25nbGlhbmdAbG9vbmdzb24uY24+Cj4g
U2lnbmVkLW9mZi1ieTogSHVhY2FpIENoZW4gPGNoZW5odWFjYWlAbG9vbmdzb24uY24+Cj4gTGlu
azogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwMjAzMDYyOTAxLjIxNTgyMzYtMS1jaGVu
aHVhY2FpQGxvb25nc29uLmNuCj4gU2lnbmVkLW9mZi1ieTogSmFrdWIgS2ljaW5za2kgPGt1YmFA
a2VybmVsLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
ZHdtYWMtbG9vbmdzb24uYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL2R3bWFjLWxvb25nc29uLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9kd21hYy1sb29uZ3Nvbi5jCj4gaW5kZXggMTA3YTdjODRhY2U4MC4uYzA1
ZTNlN2E1MzljZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9kd21hYy1sb29uZ3Nvbi5jCj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvZHdtYWMtbG9vbmdzb24uYwo+IEBAIC05MSw4ICs5MSw4IEBAIHN0YXRpYyB2b2lk
IGxvb25nc29uX2RlZmF1bHRfZGF0YShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKPiAgICAgICAgIC8q
IEdldCBidXNfaWQsIHRoaXMgY2FuIGJlIG92ZXJ3cml0dGVuIGxhdGVyICovCj4gICAgICAgICBw
bGF0LT5idXNfaWQgPSBwY2lfZGV2X2lkKHBkZXYpOwo+Cj4gLSAgICAgICAvKiBjbGtfY3NyX2kg
PSAyMC0zNU1IeiAmIE1EQyA9IGNsa19jc3JfaS8xNiAqLwo+IC0gICAgICAgcGxhdC0+Y2xrX2Nz
ciA9IFNUTU1BQ19DU1JfMjBfMzVNOwo+ICsgICAgICAgLyogY2xrX2Nzcl9pID0gMTAwLTE1ME1I
eiAmIE1EQyA9IGNsa19jc3JfaS82MiAqLwo+ICsgICAgICAgcGxhdC0+Y2xrX2NzciA9IFNUTU1B
Q19DU1JfMTAwXzE1ME07Cj4gICAgICAgICBwbGF0LT5jb3JlX3R5cGUgPSBEV01BQ19DT1JFX0dN
QUM7Cj4gICAgICAgICBwbGF0LT5mb3JjZV9zZl9kbWFfbW9kZSA9IDE7Cj4KPiAtLQo+IDIuNTEu
MAo+Cj4KPgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
