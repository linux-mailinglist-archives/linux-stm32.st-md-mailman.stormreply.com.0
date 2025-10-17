Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 396A8BEAF2A
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Oct 2025 19:01:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC849C597BC;
	Fri, 17 Oct 2025 17:01:06 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6B81C597A8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 17:01:05 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-426edfffc66so1506793f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 10:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760720465; x=1761325265;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pqg7Htrwxofmei2fLsgAe1uph5/lzKI0qa3LLNeV4j4=;
 b=hGRg6u4r3qFZaim3s8rmvrCLn/nVaSwVnxMo5gV+svuyHFIDDqErOz7APHX7B/3oFW
 kWzk2XyFQW5HNeF7kNLbFd5tI/3pDb6T4Ob+z+FqjpGlJw4DbRNG4r1Mn3WeI1O/ARxr
 dAIiSnGSyDtBOaFreUb3YJkE49y4ge7egJkz/LYuo2SGX4FhgTL4Km5O05RepmRtXYoj
 grQlN4J4TxEvIkZwTeZDNL1Wm7H3mF4/RNyhaKh5bTfNZktYWulKgPwvg3nE8l4ahHzl
 Sj1ShqzqHMPFd7m7JZiBWbKZVaFyuC/Yof6BFQGwCqq0m13gv519Y/SPZcWHmtsCf9Jf
 KY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760720465; x=1761325265;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pqg7Htrwxofmei2fLsgAe1uph5/lzKI0qa3LLNeV4j4=;
 b=o/oeTOB5GqrsCYWO3yLHzC4rUksWQR3VTX8Q2OkCB9cxnj9NoG5Eyh5YJn61HPMTYv
 ruaVMQbAhg7GDf5t04i1DDLVRgu1yDu6TLCx0G1w0F2g1svlQBV6mHhOn3rhkO7+FVH8
 +pUS4wIcJD0DpPTOpv9Hk8dQO+FY0Jt8o0jV2M0r573p6SpfmrBxZ8+9dp1KKlVk39UQ
 Z8l+jL8GZmZk1CRIFfYJWvJqmgKJXa1D7Mr9yCKqE7obvh3G3Umy62azLfrLSOkLwved
 ZN2jFzs20J4szqDCZZbSG+Z7Fxgq18SXFcQZQhnf3/szUb26UxWwL1FmQBXmBZTrhIRW
 FKmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9Gf+I6PlPBWRlnr5zc6Mlc3vjQgYD4DuKbYm92aXq2FYh+uQQnVrqrwvKlnXWR3q9Gw8lWBva2eS/nQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw/7DeJFbT/XYfGX8feW+lh8xpjUs5KTgmTb+QLMmej6UqQ8/m/
 k5weg2RRBiaG9WdYhgXdnzccy/wHltq4T2kwXi8Sc3daDsSoyd8COg/+CGBMQTn9+0lhWYRj3dw
 BR04Q8qgnTa6uzcZgyxtJjrEj3IOZFzI=
X-Gm-Gg: ASbGncuhYiEfbXzPXU6oCm0K19sQJDXyA9d/j+dcKN3bqQN+fayGlsA5LESFiHIA+tN
 SH8VUmHfy48fR7cmENuGBhRe3YzhKINsKRKuijzgyhJZJN5U/o++nQMkBtgPs4/z6ves4W+BXK0
 R9W+rnOskpgYMw14xosYdK88s+Rff5jYHzzTf130aWoOra4fcah+xUBxgX7vdLRFYhfh7NkVA/j
 hIJWpJdMWqEQAPDAVew/WfLY8N+sEyNFMRB0vMjd0t58Br1W4K/M7Y4SdzKamIMlyVgioirzq0g
 rRE6mXs=
X-Google-Smtp-Source: AGHT+IGl5uGRbmbZLL5/wdiOHc0P0AlgpbUQEkv+/OS3nj0yAr+2M9EwB6fqHN6SeNM2W4NfF3pf+/0qdkabuuH8kJo=
X-Received: by 2002:a05:6000:705:b0:426:f9d3:2feb with SMTP id
 ffacd0b85a97d-42704beea1emr3600647f8f.23.1760720464982; Fri, 17 Oct 2025
 10:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <YfEhaK7VtJ4oru03@shell.armlinux.org.uk>
In-Reply-To: <YfEhaK7VtJ4oru03@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 17 Oct 2025 18:00:38 +0100
X-Gm-Features: AS18NWDRvAVPn4Jf57le9CYGXnLlVvbhb67dsacK4IgBFRScoJpp_oMsiemCpA8
Message-ID: <CA+V-a8taTL1aQ5L1uYfJ405X38953z1FO=X5S54QBqGxLsF5ow@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/7] net: stmmac/xpcs:
	modernise PCS support
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

SGksCgpPbiBXZWQsIEphbiAyNiwgMjAyMiBhdCAxMDozMuKAr0FNIFJ1c3NlbGwgS2luZyAoT3Jh
Y2xlKQo8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IEhpLAo+Cj4gVGhpcyBzZXJp
ZXMgdXBkYXRlcyB4cGNzIGFuZCBzdG1tYWMgZm9yIHRoZSByZWNlbnQgY2hhbmdlcyB0byBwaHls
aW5rCj4gdG8gYmV0dGVyIHN1cHBvcnQgc3BsaXQgUENTIGFuZCB0byBnZXQgcmlkIG9mIHByaXZh
dGUgTUFDIHZhbGlkYXRpb24KPiBmdW5jdGlvbnMuCj4KPiBUaGlzIHNlcmllcyBpcyBzbGlnaHRs
eSBtb3JlIGludm9sdmVkIHRoYW4gb3RoZXIgY29udmVyc2lvbnMgYXMgc3RtbWFjCj4gaGFzIGFs
cmVhZHkgaGFkIG9wdGlvbmFsIHByb3BlciBzcGxpdCBQQ1Mgc3VwcG9ydC4KPgo+IFRoZSBmaXJz
dCBzaXggcGF0Y2hlcyBvZiB0aGlzIHNlcmllcyB3ZXJlIG9yaWdpbmFsbHkgcG9zdGVkIG9uIDE2
dGgKPiBEZWNlbWJlciBmb3IgQ0ZULCBhbmQgV29uZyBWZWUgS2hlZSByZXBvcnRlZCBoaXMgSW50
ZWwgRWxraGFydCBMYWtlCj4gc2V0dXAgd2FzIGZpbmUgdGhlIGZpcnN0IHNpeCB0aGVzZS4gSG93
ZXZlciwgbm8gdGVzdGVkLWJ5IHdhcyBnaXZlbi4KPgo+IFRoZSBwYXRjaGVzOgo+Cj4gMSkgUHJv
dmlkZSBhIGZ1bmN0aW9uIHRvIHF1ZXJ5IHRoZSB4cGNzIGZvciB0aGUgaW50ZXJmYWNlIG1vZGVz
IHRoYXQKPiAgICBhcmUgc3VwcG9ydGVkLgo+Cj4gMikgUG9wdWxhdGVzIHRoZSBNQUMgY2FwYWJp
bGl0aWVzIGFuZCBzd2l0Y2hlcyBzdG1tYWNfdmFsaWRhdGUoKSB0byB1c2UKPiAgICBwaHlsaW5r
X2dldF9saW5rbW9kZXMoKS4gV2UgZG8gbm90IHVzZSBwaHlsaW5rX2dlbmVyaWNfdmFsaWRhdGUo
KSB5ZXQKPiAgICBhcyAoYSkgd2UgZG8gbm90IGFsd2F5cyBoYXZlIHRoZSBzdXBwb3J0ZWQgaW50
ZXJmYWNlcyBwb3B1bGF0ZWQsIGFuZAo+ICAgIChiKSB0aGUgZXhpc3RpbmcgY29kZSBkb2VzIG5v
dCByZXN0cmljdCBiYXNlZCBvbiBpbnRlcmZhY2UuIFRoZXJlCj4gICAgc2hvdWxkIGJlIG5vIGZ1
bmN0aW9uYWwgZWZmZWN0IGZyb20gdGhpcyBwYXRjaC4KPgo+IDMpIFBvcHVsYXRlcyBwaHlsaW5r
J3Mgc3VwcG9ydGVkIGludGVyZmFjZXMgZnJvbSB0aGUgeHBjcyB3aGVuIHRoZSB4cGNzCj4gICAg
aXMgY29uZmlndXJlZCBieSBmaXJtd2FyZSBhbmQgYWxzbyB0aGUgZmlybXdhcmUgY29uZmlndXJl
ZCBpbnRlcmZhY2UKPiAgICBtb2RlLiBOb3RlOiB0aGlzIHdpbGwgcmVzdHJpY3Qgc3RtbWFjIHRv
IG9ubHkgc3VwcG9ydGluZyB0aGVzZQo+ICAgIGludGVyZmFjZXMgbW9kZXMgLSBzdG1tYWMgbWFp
bnRhaW5lcnMgbmVlZCB0byB2ZXJpZnkgdGhhdCB0aGlzCj4gICAgYmVoYXZpb3VyIGlzIGFjY2Vw
dGFibGUuCj4KPiA0KSBzdG1tYWNfdmFsaWRhdGUoKSB0YWlsLWNhbGxzIHhwY3NfdmFsaWRhdGUo
KSwgYnV0IHdlIGRvbid0IG5lZWQgaXQgdG8KPiAgICBub3cgdGhhdCBQQ1MgaGF2ZSB0aGVpciBv
d24gdmFsaWRhdGlvbiBtZXRob2QuIENvbnZlcnQgc3RtbWFjIGFuZAo+ICAgIHhwY3MgdG8gdXNl
IHRoaXMgbWV0aG9kIGluc3RlYWQuCj4KPiA1KSB4cGNzIHNldHMgdGhlIHBvbGwgZmllbGQgb2Yg
cGh5bGlua19wY3MgdG8gdHJ1ZSwgbWVhbmluZyB4cGNzCj4gICAgcmVxdWlyZXMgaXRzIHN0YXR1
cyB0byBiZSBwb2xsZWQuIFRoZXJlIGlzIG5vIG5lZWQgdG8gYWxzbyBzZXQgdGhlCj4gICAgcGh5
bGlua19jb25maWcucGNzX3BvbGwuIFJlbW92ZSB0aGlzLgo+Cj4gNikgU3dpdGNoIHRvIHBoeWxp
bmtfZ2VuZXJpY192YWxpZGF0ZSgpLiBUaGlzIGlzIHByb2JhYmx5IHRoZSBtb3N0Cj4gICAgY29u
dHJhdmVydGlhbCBjaGFuZ2UgaW4gdGhpcyBwYXRjaCBzZXQgYXMgdGhpcyB3aWxsIGNhdXNlIHRo
ZSBNQUMgdG8KPiAgICByZXN0cmljdCBsaW5rIG1vZGVzIGJhc2VkIG9uIHRoZSBpbnRlcmZhY2Ug
bW9kZS4gRnJvbSBhbiBpbnNwZWN0aW9uCj4gICAgb2YgdGhlIHhwY3MgZHJpdmVyLCB0aGlzIHNo
b3VsZCBiZSBzYWZlLCBhcyBYUENTIG9ubHkgZnVydGhlcgo+ICAgIHJlc3RyaWN0cyB0aGUgbGlu
ayBtb2RlcyB0byBhIHN1YnNldCBvZiB0aGVzZSAod2hldGhlciB0aGF0IGlzCj4gICAgY29ycmVj
dCBvciBub3QgaXMgbm90IGFuIGlzc3VlIEkgYW0gYWRkcmVzc2luZyBoZXJlLikgRm9yCj4gICAg
aW1wbGVtZW50YXRpb25zIHRoYXQgZG8gbm90IHVzZSB4cGNzLCB0aGlzIGlzIGEgbW9yZSBvcGVu
IHF1ZXN0aW9uCj4gICAgYW5kIG5lZWRzIGZlZWRiYWNrIGZyb20gc3RtbWFjIG1haW50YWluZXJz
Lgo+Cj4gNykgQ29udmVydCB0byB1c2UgbWFjX3NlbGVjdF9wY3MoKSByYXRoZXIgdGhhbiBwaHls
aW5rX3NldF9wY3MoKSB0byBzZXQKPiAgICB0aGUgUENTIC0gdGhlIGludGVudGlvbiBpcyB0byBl
dmVudHVhbGx5IHJlbW92ZSBwaHlsaW5rX3NldF9wY3MoKQo+ICAgIG9uY2UgdGhlcmUgYXJlIG5v
IG1vcmUgdXNlcnMgb2YgdGhpcy4KPgo+IHYyOiBmaXggc2lnbm9mZiBhbmQgdGVtcG9yYXJ5IHdh
cm5pbmcgaW4gcGF0Y2ggNAo+Cj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L3N0bW1hY19tYWluLmMgfCAxNDcgKysrKysrKy0tLS0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL25l
dC9wY3MvcGNzLXhwY3MuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQxICsrKy0tLQo+ICBp
bmNsdWRlL2xpbnV4L3Bjcy9wY3MteHBjcy5oICAgICAgICAgICAgICAgICAgICAgIHwgICAzICst
Cj4gIDMgZmlsZXMgY2hhbmdlZCwgNzMgaW5zZXJ0aW9ucygrKSwgMTE4IGRlbGV0aW9ucygtKQo+
CkFsdGhvdWdoIFJaL1YySCBkb2Vzbid0IGhhdmUgUENTLCBpdCB0ZXN0ZWQgdGhpcyBvbiBSZW5l
c2FzIFJaL1YySCBFVksKYW5kIGZvdW5kIG5vIHJlZ3Jlc3Npb25zLgoKVGVzdGVkLWJ5OiBMYWQg
UHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+CgpDaGVl
cnMsClByYWJoYWthcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
