Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAEF2C1B0A
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Nov 2020 02:46:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68F19C56631;
	Tue, 24 Nov 2020 01:46:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8613BC3089F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Nov 2020 01:46:55 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D0FEE206FA;
 Tue, 24 Nov 2020 01:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606182413;
 bh=l8PzaObySRRsk8Qr2VGSW2cE2KYLeZxGCFjBrnWF/Lc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UW7qkn00cv0wKiMaPmt66xG3QkCT8bOVJt7eg3jDQbxlQGPJk4mx/VqCDN8ptUhlR
 dhn0h/4nyOm1M8zdsuA37E4QjM+7Riaqfpsc9IapZPm4KcMQtw7px4ieszGaMfwO0Z
 lfMGoIgQ4EohQhNLmkPGid0CCriQVWDtDbY9z+UQ=
Date: Mon, 23 Nov 2020 17:46:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Message-ID: <20201123174648.6a22575b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <CAKwvOdntVfXj2WRR5n6Kw7BfG7FdKpTeHeh5nPu5AzwVMhOHTg@mail.gmail.com>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
 <CAKwvOdntVfXj2WRR5n6Kw7BfG7FdKpTeHeh5nPu5AzwVMhOHTg@mail.gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org,
	linux-atm-general@lists.sourceforge.net,
	dri-devel <dri-devel@lists.freedesktop.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, dm-devel@redhat.com,
	keyrings@vger.kernel.org, GR-everest-linux-l2@marvell.com,
	linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
	drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org,
	linux-cifs@vger.kernel.org,
	32-BIT AND 64-BIT <X86@stm-ict-prod-mailman-01.stormreply.prv>,
	bridge@lists.linux-foundation.org,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	cluster-devel@redhat.com, linux-acpi@vger.kernel.org,
	coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
	Kees Cook <keescook@chromium.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	intel-gfx@lists.freedesktop.org, linux-can@vger.kernel.org,
	linux-block@vger.kernel.org, ceph-devel@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	GR-Linux-NIC-Dev@marvell.com, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH 000/141] Fix fall-through warnings for
	Clang
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

T24gTW9uLCAyMyBOb3YgMjAyMCAxNzozMjo1MSAtMDgwMCBOaWNrIERlc2F1bG5pZXJzIHdyb3Rl
Ogo+IE9uIFN1biwgTm92IDIyLCAyMDIwIGF0IDg6MTcgQU0gS2VlcyBDb29rIDxrZWVzY29va0Bj
aHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4gT24gRnJpLCBOb3YgMjAsIDIwMjAgYXQgMTE6NTE6NDJB
TSAtMDgwMCwgSmFrdWIgS2ljaW5za2kgd3JvdGU6ICAKPiA+ID4gSWYgbm9uZSBvZiB0aGUgMTQw
IHBhdGNoZXMgaGVyZSBmaXggYSByZWFsIGJ1ZywgYW5kIHRoZXJlIGlzIG5vIGNoYW5nZQo+ID4g
PiB0byBtYWNoaW5lIGNvZGUgdGhlbiBpdCBzb3VuZHMgdG8gbWUgbGlrZSBhIFc9MiBraW5kIG9m
IGEgd2FybmluZy4gIAo+ID4KPiA+IEZXSVcsIHRoaXMgc2VyaWVzIGhhcyBmb3VuZCBhdCBsZWFz
dCBvbmUgYnVnIHNvIGZhcjoKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvQ0FGQ3dm
MTFpekhGPWcxbUdyeTFmRTVrdkZGRnJ4emhQU002cUtBTzhneFNwPUtyX0NRQG1haWwuZ21haWwu
Y29tLyAgCj4gCj4gU28gbG9va3MgbGlrZSB0aGUgYnVsayBvZiB0aGVzZSBhcmU6Cj4gc3dpdGNo
ICh4KSB7Cj4gICBjYXNlIDA6Cj4gICAgICsreDsKPiAgIGRlZmF1bHQ6Cj4gICAgIGJyZWFrOwo+
IH0KPiAKPiBJIGhhdmUgYSBwYXRjaCB0aGF0IGZpeGVzIHRob3NlIHVwIGZvciBjbGFuZzoKPiBo
dHRwczovL3Jldmlld3MubGx2bS5vcmcvRDkxODk1Cgrwn5iNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
