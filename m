Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1444B55E543
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jun 2022 16:18:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBBB7C5F1EE;
	Tue, 28 Jun 2022 14:18:31 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4AAAC035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jun 2022 14:18:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 48579B81E3B;
 Tue, 28 Jun 2022 14:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B5F2C341C6;
 Tue, 28 Jun 2022 14:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656425908;
 bh=gNqsfpabtVurh3KrN/HDHkVIuq5HYEGkFj0dq9pxBp0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LKmDxdeiZbNhcfCtRCGKrWsyjlCMGrWNe6JPI6+0Ud4+CdurjXwUmrO+N85g9uStN
 ZMyX+h6jcWDShk2bKHv4I1CwjG76KgIokSJRaPNHE+tAExMRqCJhyYb+qk23PpSnt8
 UZagMIRlLLl0N2746CMcacDFBvR451lE95WpeBq0GW4QDuaouxlRRNIVOVHDclrQ6f
 3R9oBNaPqtGDm4Fzozu0TEhclsuvbNSWpoAarBMEoFPJEcd4AO2pVjb65zJgdF1PVp
 ef3Ggil+1czhmYD/i4aHezmCjBjk3ri61YXhTXJoT9Ami17Y24U2vq1uockAAm5n3K
 LL1PsE5NQ0Syg==
Date: Tue, 28 Jun 2022 16:18:23 +0200
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Stephen Hemminger <stephen@networkplumber.org>
Message-ID: <20220628141823.GB25163@embeddedor>
References: <20220627180432.GA136081@embeddedor>
 <20220627125343.44e24c41@hermes.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220627125343.44e24c41@hermes.local>
Cc: nvdimm@lists.linux.dev, alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net,
 linux-stm32@st-md-mailman.stormreply.com, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 kasan-dev@googlegroups.com, lvs-devel@vger.kernel.org, coreteam@netfilter.org,
 v9fs-developer@lists.sourceforge.net, Kees Cook <keescook@chromium.org>,
 intel-gfx@lists.freedesktop.org, linux-can@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 virtualization@lists.linux-foundation.org, io-uring@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-sctp@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH][next] treewide: uapi: Replace zero-length
 arrays with flexible-array members
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

T24gTW9uLCBKdW4gMjcsIDIwMjIgYXQgMTI6NTM6NDNQTSAtMDcwMCwgU3RlcGhlbiBIZW1taW5n
ZXIgd3JvdGU6Cj4gVGhhbmtzIHRoaXMgZml4ZXMgd2FybmluZyB3aXRoIGdjYy0xMiBpbiBpcHJv
dXRlMi4KPiBJbiBmdW5jdGlvbiDigJh4ZnJtX2FsZ29fcGFyc2XigJksCj4gICAgIGlubGluZWQg
ZnJvbSDigJh4ZnJtX3N0YXRlX21vZGlmeS5jb25zdHByb3DigJkgYXQgeGZybV9zdGF0ZS5jOjU3
Mzo1Ogo+IHhmcm1fc3RhdGUuYzoxNjI6MzI6IHdhcm5pbmc6IHdyaXRpbmcgMSBieXRlIGludG8g
YSByZWdpb24gb2Ygc2l6ZSAwIFstV3N0cmluZ29wLW92ZXJmbG93PV0KPiAgIDE2MiB8ICAgICAg
ICAgICAgICAgICAgICAgICAgIGJ1ZltqXSA9IHZhbDsKPiAgICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgIH5+fn5+fn5efn5+fgoKR3JlYXQhIFRoaXMgZ2l2ZXMgbWUgaG9wZS4gOikKClRo
YW5rcwotLQpHdXN0YXZvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
