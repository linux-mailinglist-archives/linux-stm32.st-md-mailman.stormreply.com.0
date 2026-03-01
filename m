Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id q7rhJ8rgo2kTRAUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 07:46:34 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2522F1CEAC3
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 07:46:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB706C36B3D;
	Sun,  1 Mar 2026 06:46:33 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1370C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Mar 2026 06:46:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C627660008
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Mar 2026 06:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C614C116C6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Mar 2026 06:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772347591;
 bh=c7yt7t1C7IKL+PTpcaEB7MdzhrMReQnLePjLzslok6M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Smg8NnrELaPtnPQPrQHongBwDTvCU9ZD3AeAZ11USkiZjL87XgAkTGwZRlBjsmvAL
 x8Ys5TRnpkAe7NCGnBr+zFJ4b+7gZhFTF7lz37kP+sXXAfRzTX4o/+AS7jcbUPVgL+
 bY1D732eG3r6l/AyciB7d1y4ZbD7JaxAq3ymY8jU8PYRC9/7at4/BIgAMfHO65rmeh
 pw1FIW3rrfGgGomcKF3wFah5AQQHhYtffa316hVhCkulpzcrUCf8BluChJC1gsyOpg
 MZxwHoEMFPUIg48ejALTN+FtrRDI8YMSaBMUdvfvsgYFuueNALqb1o2F14YLRyQAhO
 Xd8xDonEt249g==
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-65bfc858561so6229154a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Feb 2026 22:46:31 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUU75aSDSv0BaK3HXRDg3/bQT4jjxAVszbb/0DS/yjIunsmB0LQTSrRZS6ntQL/D6lTnRVn+NK0LjxFBQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyEqFaahmuOI9CWjK2ljf37VP057gmhiOh/pOE5AOlvJt5MiRgV
 hZ/whIaMH1wgqEHadLPBUW0j0lasEn/+AEOVB9NUr4FKssvjXKMfMlm95az88J9ww/t6BeaEoL2
 vpzmAJLMhe6V+laTZImjkQ+tLWpIkmhg=
X-Received: by 2002:a05:6402:f23:b0:65f:730d:8026 with SMTP id
 4fb4d7f45d1cf-65fdd6d76efmr3466140a12.9.1772347589719; Sat, 28 Feb 2026
 22:46:29 -0800 (PST)
MIME-Version: 1.0
References: <20260301014529.1708098-1-sashal@kernel.org>
In-Reply-To: <20260301014529.1708098-1-sashal@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 1 Mar 2026 14:46:18 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7cxVAG3QKSDaUg-M-AYGMCVBqvUqnps52paScPMYO8Qg@mail.gmail.com>
X-Gm-Features: AaiRm507T7L922KCkjo9JPTmLoki11dW6Wc7eq38sLI5dzSAZfHwtLRzBf0YCu0
Message-ID: <CAAhV-H7cxVAG3QKSDaUg-M-AYGMCVBqvUqnps52paScPMYO8Qg@mail.gmail.com>
To: Sasha Levin <sashal@kernel.org>
Cc: netdev@vger.kernel.org, stable@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Hongliang Wang <wanghongliang@loongson.cn>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [Linux-stm32] FAILED: Patch "net: stmmac: dwmac-loongson: Set
 clk_csr_i to 100-150MHz" failed to apply to 6.1-stable tree
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
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[loongson.cn:email,mail.gmail.com:mid,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 2522F1CEAC3
X-Rspamd-Action: no action

SGksIFNhc2hhLAoKT24gU3VuLCBNYXIgMSwgMjAyNiBhdCA5OjQ14oCvQU0gU2FzaGEgTGV2aW4g
PHNhc2hhbEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IFRoZSBwYXRjaCBiZWxvdyBkb2VzIG5vdCBh
cHBseSB0byB0aGUgNi4xLXN0YWJsZSB0cmVlLgo+IElmIHNvbWVvbmUgd2FudHMgaXQgYXBwbGll
ZCB0aGVyZSwgb3IgdG8gYW55IG90aGVyIHN0YWJsZSBvciBsb25ndGVybQo+IHRyZWUsIHRoZW4g
cGxlYXNlIGVtYWlsIHRoZSBiYWNrcG9ydCwgaW5jbHVkaW5nIHRoZSBvcmlnaW5hbCBnaXQgY29t
bWl0Cj4gaWQgdG8gPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+LgpJIGhhdmUgYWxyZWFkeSBzdWJt
aXQgYSBwYXRjaCBmb3IgNi4xIHNvbWUgZGF5cyBhZ286Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xvb25nYXJjaC8yMDI2MDIxODEyMTMxMC4yNTQ1MTQ5LTEtY2hlbmh1YWNhaUBsb29uZ3Nvbi5j
bi9ULyN1CgpIdWFjYWkKCj4KPiBUaGFua3MsCj4gU2FzaGEKPgo+IC0tLS0tLS0tLS0tLS0tLS0t
LSBvcmlnaW5hbCBjb21taXQgaW4gTGludXMncyB0cmVlIC0tLS0tLS0tLS0tLS0tLS0tLQo+Cj4g
RnJvbSBlMWFhNWVmODkyZmI0ZmE5MDE0YTI1ZTg3YjY0Yjk3MzQ3OTE5ZDM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQo+IEZyb206IEh1YWNhaSBDaGVuIDxjaGVuaHVhY2FpQGxvb25nc29uLmNu
Pgo+IERhdGU6IFR1ZSwgMyBGZWIgMjAyNiAxNDoyOTowMSArMDgwMAo+IFN1YmplY3Q6IFtQQVRD
SF0gbmV0OiBzdG1tYWM6IGR3bWFjLWxvb25nc29uOiBTZXQgY2xrX2Nzcl9pIHRvIDEwMC0xNTBN
SHoKPgo+IEN1cnJlbnQgY2xrX2Nzcl9pIHNldHRpbmcgb2YgTG9vbmdzb24gU1RNTUFDIChpbmNs
dWRpbmcgTFM3QTEwMDAvMjAwMAo+IGFuZCBMUzJLMTAwMC8yMDAwLzMwMDApIGFyZSBjb3B5ICYg
cGFzdGUgZnJvbSBvdGhlciBkcml2ZXJzLiBJbiBmYWN0LAo+IExvb25nc29uIFNUTU1BQyB1c2Ug
MTI1TUh6IGNsb2NrcyBhbmQgbmVlZCA2MiBmcmVxIGRpdmlzaW9uIHRvIHdpdGhpbgo+IDIuNU1I
eiwgbWVldGluZyBtb3N0IFBIWSBNREMgcmVxdWlyZW1lbnQuIFNvIGZpeCBieSBzZXR0aW5nIGNs
a19jc3JfaQo+IHRvIDEwMC0xNTBNSHosIG90aGVyd2lzZSBzb21lIFBIWXMgbWF5IGxpbmsgZmFp
bC4KPgo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gRml4ZXM6IDMwYmJhNjlkN2RiNDBl
NyAoInN0bW1hYzogcGNpOiBBZGQgZHdtYWMgc3VwcG9ydCBmb3IgTG9vbmdzb24iKQo+IFNpZ25l
ZC1vZmYtYnk6IEhvbmdsaWFuZyBXYW5nIDx3YW5naG9uZ2xpYW5nQGxvb25nc29uLmNuPgo+IFNp
Z25lZC1vZmYtYnk6IEh1YWNhaSBDaGVuIDxjaGVuaHVhY2FpQGxvb25nc29uLmNuPgo+IExpbms6
IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MDIwMzA2MjkwMS4yMTU4MjM2LTEtY2hlbmh1
YWNhaUBsb29uZ3Nvbi5jbgo+IFNpZ25lZC1vZmYtYnk6IEpha3ViIEtpY2luc2tpIDxrdWJhQGtl
cm5lbC5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3
bWFjLWxvb25nc29uLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9kd21hYy1sb29uZ3Nvbi5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3Rt
aWNyby9zdG1tYWMvZHdtYWMtbG9vbmdzb24uYwo+IGluZGV4IDEwN2E3Yzg0YWNlODAuLmMwNWUz
ZTdhNTM5Y2YgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvZHdtYWMtbG9vbmdzb24uYwo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL2R3bWFjLWxvb25nc29uLmMKPiBAQCAtOTEsOCArOTEsOCBAQCBzdGF0aWMgdm9pZCBs
b29uZ3Nvbl9kZWZhdWx0X2RhdGEoc3RydWN0IHBjaV9kZXYgKnBkZXYsCj4gICAgICAgICAvKiBH
ZXQgYnVzX2lkLCB0aGlzIGNhbiBiZSBvdmVyd3JpdHRlbiBsYXRlciAqLwo+ICAgICAgICAgcGxh
dC0+YnVzX2lkID0gcGNpX2Rldl9pZChwZGV2KTsKPgo+IC0gICAgICAgLyogY2xrX2Nzcl9pID0g
MjAtMzVNSHogJiBNREMgPSBjbGtfY3NyX2kvMTYgKi8KPiAtICAgICAgIHBsYXQtPmNsa19jc3Ig
PSBTVE1NQUNfQ1NSXzIwXzM1TTsKPiArICAgICAgIC8qIGNsa19jc3JfaSA9IDEwMC0xNTBNSHog
JiBNREMgPSBjbGtfY3NyX2kvNjIgKi8KPiArICAgICAgIHBsYXQtPmNsa19jc3IgPSBTVE1NQUNf
Q1NSXzEwMF8xNTBNOwo+ICAgICAgICAgcGxhdC0+Y29yZV90eXBlID0gRFdNQUNfQ09SRV9HTUFD
Owo+ICAgICAgICAgcGxhdC0+Zm9yY2Vfc2ZfZG1hX21vZGUgPSAxOwo+Cj4gLS0KPiAyLjUxLjAK
Pgo+Cj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
