Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFpuN+Teo2mGQgUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 07:38:28 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3A01CEA56
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 07:38:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20B9DC030CD;
	Sun,  1 Mar 2026 06:38:28 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98534C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Mar 2026 06:38:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 61A60442E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Mar 2026 06:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4214BC2BC9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Mar 2026 06:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772347105;
 bh=88o1axfZfrS6umlnTLtfz3bDCQajM1uVbt0V0dlisqY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eh7RsHVp1g/Z1qcHgubqF6DXl8bQjKKE7PbYqa8WF7bj1cN24BrlV9NMRJIpT8Fzn
 rdo5YlnHfNjL6nbaP1dTgIxaLlwRZyqtQUEUE7hdWT3kdBxt4t5uq0FLvZoa/oGc7p
 RrMZZl+PDUmcKc3WdgxiPswLqci5+Wm7CwRtvibqtGHkldmNvf+7dAXNrDJQRBfH63
 M2urp4A+n3Z+EBpgHzuvCCpED0ckoJ4DQTG/0plIw9ShtjUPy2MmzZlJ3HlfsAH4Yr
 6C6WpVBClxE88MAnquoZi1hPM1/sDrE7hOZIlfOvXyHKq0V7TKRxL7JOB13+kCvHvU
 Oxbes9npHG/ag==
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-65baa72399fso4652330a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Feb 2026 22:38:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVlynBmWBCTPVkHotQgyNRRO6anADfJjvANy6rFICk29YzW6FsShhFAALRHt2k27GKOQw3uxbcDWTMBSg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxDfLtLZ4XoeF506mILR5oIi1E1EQDcjnDR8dZQFeboIZGLKEjz
 4iSnQwPze3I93moKCyxgU2vIf2XykNQ3Niw6WuDDoS+yeCGqgPvbPOVyYZ51RP7VROcTox9JzZ4
 MIJ27IM1RaQfXvTHO56iQYLAf22WTe6g=
X-Received: by 2002:a05:6402:26c9:b0:64b:83cb:d943 with SMTP id
 4fb4d7f45d1cf-65fdd6be020mr4850268a12.6.1772347103783; Sat, 28 Feb 2026
 22:38:23 -0800 (PST)
MIME-Version: 1.0
References: <20260301013640.1696690-1-sashal@kernel.org>
In-Reply-To: <20260301013640.1696690-1-sashal@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 1 Mar 2026 14:38:12 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4qU7GSJRMPm3253dRB97mvhKOH6m_GGjA4b-itDz384A@mail.gmail.com>
X-Gm-Features: AaiRm53sz9DVhIh-5fus-ezv4_hsXvql4TrfiX1Xpwrvt367E5_JQhQdXVmr2Oc
Message-ID: <CAAhV-H4qU7GSJRMPm3253dRB97mvhKOH6m_GGjA4b-itDz384A@mail.gmail.com>
To: Sasha Levin <sashal@kernel.org>
Cc: netdev@vger.kernel.org, stable@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Hongliang Wang <wanghongliang@loongson.cn>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [Linux-stm32] FAILED: Patch "net: stmmac: dwmac-loongson: Set
 clk_csr_i to 100-150MHz" failed to apply to 6.6-stable tree
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[loongson.cn:email,mail.gmail.com:mid,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 7B3A01CEA56
X-Rspamd-Action: no action

SGksIFNhc2hhLAoKT24gU3VuLCBNYXIgMSwgMjAyNiBhdCA5OjM24oCvQU0gU2FzaGEgTGV2aW4g
PHNhc2hhbEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IFRoZSBwYXRjaCBiZWxvdyBkb2VzIG5vdCBh
cHBseSB0byB0aGUgNi42LXN0YWJsZSB0cmVlLgo+IElmIHNvbWVvbmUgd2FudHMgaXQgYXBwbGll
ZCB0aGVyZSwgb3IgdG8gYW55IG90aGVyIHN0YWJsZSBvciBsb25ndGVybQo+IHRyZWUsIHRoZW4g
cGxlYXNlIGVtYWlsIHRoZSBiYWNrcG9ydCwgaW5jbHVkaW5nIHRoZSBvcmlnaW5hbCBnaXQgY29t
bWl0Cj4gaWQgdG8gPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+LgpJIGhhdmUgYWxyZWFkeSBzdWJt
aXQgYSBwYXRjaCBmb3IgNi42IHNvbWUgZGF5cyBhZ286Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xvb25nYXJjaC8yMDI2MDIxODEyMTI0Mi4yNTQ1MTI4LTEtY2hlbmh1YWNhaUBsb29uZ3Nvbi5j
bi9ULyN1CgpIdWFjYWkKPgo+IFRoYW5rcywKPiBTYXNoYQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0t
IG9yaWdpbmFsIGNvbW1pdCBpbiBMaW51cydzIHRyZWUgLS0tLS0tLS0tLS0tLS0tLS0tCj4KPiBG
cm9tIGUxYWE1ZWY4OTJmYjRmYTkwMTRhMjVlODdiNjRiOTczNDc5MTlkMzcgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCj4gRnJvbTogSHVhY2FpIENoZW4gPGNoZW5odWFjYWlAbG9vbmdzb24uY24+
Cj4gRGF0ZTogVHVlLCAzIEZlYiAyMDI2IDE0OjI5OjAxICswODAwCj4gU3ViamVjdDogW1BBVENI
XSBuZXQ6IHN0bW1hYzogZHdtYWMtbG9vbmdzb246IFNldCBjbGtfY3NyX2kgdG8gMTAwLTE1ME1I
ego+Cj4gQ3VycmVudCBjbGtfY3NyX2kgc2V0dGluZyBvZiBMb29uZ3NvbiBTVE1NQUMgKGluY2x1
ZGluZyBMUzdBMTAwMC8yMDAwCj4gYW5kIExTMksxMDAwLzIwMDAvMzAwMCkgYXJlIGNvcHkgJiBw
YXN0ZSBmcm9tIG90aGVyIGRyaXZlcnMuIEluIGZhY3QsCj4gTG9vbmdzb24gU1RNTUFDIHVzZSAx
MjVNSHogY2xvY2tzIGFuZCBuZWVkIDYyIGZyZXEgZGl2aXNpb24gdG8gd2l0aGluCj4gMi41TUh6
LCBtZWV0aW5nIG1vc3QgUEhZIE1EQyByZXF1aXJlbWVudC4gU28gZml4IGJ5IHNldHRpbmcgY2xr
X2Nzcl9pCj4gdG8gMTAwLTE1ME1Ieiwgb3RoZXJ3aXNlIHNvbWUgUEhZcyBtYXkgbGluayBmYWls
Lgo+Cj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBGaXhlczogMzBiYmE2OWQ3ZGI0MGU3
ICgic3RtbWFjOiBwY2k6IEFkZCBkd21hYyBzdXBwb3J0IGZvciBMb29uZ3NvbiIpCj4gU2lnbmVk
LW9mZi1ieTogSG9uZ2xpYW5nIFdhbmcgPHdhbmdob25nbGlhbmdAbG9vbmdzb24uY24+Cj4gU2ln
bmVkLW9mZi1ieTogSHVhY2FpIENoZW4gPGNoZW5odWFjYWlAbG9vbmdzb24uY24+Cj4gTGluazog
aHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwMjAzMDYyOTAxLjIxNTgyMzYtMS1jaGVuaHVh
Y2FpQGxvb25nc29uLmNuCj4gU2lnbmVkLW9mZi1ieTogSmFrdWIgS2ljaW5za2kgPGt1YmFAa2Vy
bmVsLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdt
YWMtbG9vbmdzb24uYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL2R3bWFjLWxvb25nc29uLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYy1sb29uZ3Nvbi5jCj4gaW5kZXggMTA3YTdjODRhY2U4MC4uYzA1ZTNl
N2E1MzljZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9kd21hYy1sb29uZ3Nvbi5jCj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvZHdtYWMtbG9vbmdzb24uYwo+IEBAIC05MSw4ICs5MSw4IEBAIHN0YXRpYyB2b2lkIGxv
b25nc29uX2RlZmF1bHRfZGF0YShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKPiAgICAgICAgIC8qIEdl
dCBidXNfaWQsIHRoaXMgY2FuIGJlIG92ZXJ3cml0dGVuIGxhdGVyICovCj4gICAgICAgICBwbGF0
LT5idXNfaWQgPSBwY2lfZGV2X2lkKHBkZXYpOwo+Cj4gLSAgICAgICAvKiBjbGtfY3NyX2kgPSAy
MC0zNU1IeiAmIE1EQyA9IGNsa19jc3JfaS8xNiAqLwo+IC0gICAgICAgcGxhdC0+Y2xrX2NzciA9
IFNUTU1BQ19DU1JfMjBfMzVNOwo+ICsgICAgICAgLyogY2xrX2Nzcl9pID0gMTAwLTE1ME1IeiAm
IE1EQyA9IGNsa19jc3JfaS82MiAqLwo+ICsgICAgICAgcGxhdC0+Y2xrX2NzciA9IFNUTU1BQ19D
U1JfMTAwXzE1ME07Cj4gICAgICAgICBwbGF0LT5jb3JlX3R5cGUgPSBEV01BQ19DT1JFX0dNQUM7
Cj4gICAgICAgICBwbGF0LT5mb3JjZV9zZl9kbWFfbW9kZSA9IDE7Cj4KPiAtLQo+IDIuNTEuMAo+
Cj4KPgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
