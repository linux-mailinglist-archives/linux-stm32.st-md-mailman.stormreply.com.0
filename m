Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ED4972478
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Sep 2024 23:21:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B623C71290;
	Mon,  9 Sep 2024 21:21:06 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC0F6C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Sep 2024 21:20:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0E6CE5C029A;
 Mon,  9 Sep 2024 21:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A2BC4CEC5;
 Mon,  9 Sep 2024 21:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725916857;
 bh=tK0vooX06fNMJDsOaDbjgFNdPUmm25HgOZttNw444Wc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=FKV7PFNoHKTi30ShjIpCoZkwRE9t9Bfen1obWZlTvE/7kBYKoIEn31C3N39nYrzLS
 wV2jGW6w3KN0K3zsvrErlzYPWwBetvWrY2f307qC1q/3r6J+/p1zFtPeTYhXIBOgN0
 eciafNUixANNFxl6vSdZtqlBS5a9LmNMRn55+D94diIDR7T0G/PHhYyWeO5X33k4FG
 eTc+U7uq9LECMV+8qgZJNyPQQ3B1/4G+QyMY4iVu63qvL0PddnNwd/KXYnczd4Jcm4
 IDC2sERGEVlUEXtxEBNhzMRj5ryAeR0lohVqt8NWNujt4iZz2fJvqK4Z8M+XAaInC8
 wBai1QZE/xkAA==
Message-ID: <ca22b69fe6311ba87a7dcca9948a62a7.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240909144026.870565-2-u.kleine-koenig@baylibre.com>
References: <20240909144026.870565-2-u.kleine-koenig@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Date: Mon, 09 Sep 2024 14:20:55 -0700
User-Agent: alot/0.10
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] clk: Switch back to struct
	platform_driver::remove()
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

UXVvdGluZyBVd2UgS2xlaW5lLUvDtm5pZyAoMjAyNC0wOS0wOSAwNzo0MDoyNSkKPiBBZnRlciBj
b21taXQgMGVkYjU1NWE2NWQxICgicGxhdGZvcm06IE1ha2UgcGxhdGZvcm1fZHJpdmVyOjpyZW1v
dmUoKQo+IHJldHVybiB2b2lkIikgLnJlbW92ZSgpIGlzIChhZ2FpbikgdGhlIHJpZ2h0IGNhbGxi
YWNrIHRvIGltcGxlbWVudCBmb3IKPiBwbGF0Zm9ybSBkcml2ZXJzLgo+IAo+IENvbnZlcnQgYWxs
IGNsayBkcml2ZXJzIHRvIHVzZSAucmVtb3ZlKCksIHdpdGggdGhlIGV2ZW50dWFsIGdvYWwgdG8g
ZHJvcAo+IHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXI6OnJlbW92ZV9uZXcoKS4gQXMgLnJlbW92ZSgp
IGFuZCAucmVtb3ZlX25ldygpIGhhdmUKPiB0aGUgc2FtZSBwcm90b3R5cGVzLCBjb252ZXJzaW9u
IGlzIGRvbmUgYnkganVzdCBjaGFuZ2luZyB0aGUgc3RydWN0dXJlCj4gbWVtYmVyIG5hbWUgaW4g
dGhlIGRyaXZlciBpbml0aWFsaXplci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvD
tm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KPiAtLS0KPiBIZWxsbywKPiAKPiBJ
IHdhcyBsYXp5IGFuZCBjcmVhdGVkIGEgc2luZ2xlIHBhdGNoIGZvciBhbGwgb2YgY2xrLiBQbGVh
c2UgdGVsbCBtZSBpZgo+IEkgc2hvdWxkIHNwbGl0IHBlciB2ZW5kb3IgKG9yIHBlci1kcml2ZXIp
LiBHaXZlbiB0aGF0IHRvdWNoZXMgc28gbWFueQo+IGRyaXZlcnMsIEkgYWxzbyBzdHJpcHBlZCB0
aGUgaW5kaXZpZHVhbCBtYWludGFpbmVycyBhbmQganVzdCBrZXB0IHRoZQo+IG1haWxpbmcgbGlz
dHMuIEkgaG9wZSB0aGlzIGRvZXNuJ3QgcHJldmVudCBwZW9wbGUgdG8gZ2l2ZSBmZWVkYmFjaywg
YnV0Cj4gb3RoZXJ3aXNlIHRoZSBDYzogbGlzdCBnZXRzIEh1Z2UuCj4gCgpJJ2xsIGFwcGx5IGl0
IG9uIHRvcCBvZiBjbGstbmV4dCByaWdodCBiZWZvcmUgc2VuZGluZyB0aGUgbWFpbiBjbGsgUFIg
dG8KTGludXMuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
