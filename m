Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5A7BBDC34
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Oct 2025 12:47:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E19A2C36B3E;
	Mon,  6 Oct 2025 10:47:51 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7E17C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Oct 2025 10:47:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 533CD4333D;
 Mon,  6 Oct 2025 10:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FDD7C4CEF5;
 Mon,  6 Oct 2025 10:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1759747669;
 bh=FX1Lzu7+bvM9e8qmukvbO1hpPMzmlxgfp1qFo7AK/EQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E597mMN/x7YVkjNX1Bc0G8W7GHt89kk8u2seksXgi5q2H3Gw9DqBry/MoIgd7Hl/f
 QcuYuZ/DwxfZxXg04LwRoNwgtiAl8T7SsOstK7UXK8SyqkUmffohAckrwzORjzcTe+
 /i/1SV3Pn0pttPu3dXePy8Hlmyjuwx9fL801o6Qw=
Date: Mon, 6 Oct 2025 12:47:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Eliav Farber <farbere@amazon.com>
Message-ID: <2025100648-capable-register-101b@gregkh>
References: <20251003130006.41681-1-farbere@amazon.com>
 <20251003130006.41681-8-farbere@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251003130006.41681-8-farbere@amazon.com>
Cc: snitzer@redhat.com, quic_akhilpo@quicinc.com, linus.walleij@linaro.org,
 dri-devel@lists.freedesktop.org, malattia@linux.it,
 linux-stm32@st-md-mailman.stormreply.com, sashal@kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, kadlec@netfilter.org,
 linux-sparse@vger.kernel.org, linux-sunxi@lists.linux.dev, linux@roeck-us.net,
 pmladek@suse.com, jdelvare@suse.com, linux-um@lists.infradead.org,
 luto@kernel.org, tglx@linutronix.de, sean@poorly.run, qiuxu.zhuo@intel.com,
 linux-kernel@vger.kernel.org, senozhatsky@chromium.org,
 netfilter-devel@vger.kernel.org, jack@suse.com, akpm@linux-foundation.org,
 freedreno@lists.freedesktop.org, airlied@linux.ie, dave.hansen@linux.intel.com,
 dm-devel@redhat.com, shuah@kernel.org, agk@redhat.com,
 krzysztof.kozlowski@canonical.com, ruanjinjie@huawei.com,
 coreteam@netfilter.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org, tony.luck@intel.com, tytso@mit.edu,
 Linus Torvalds <torvalds@linux-foundation.org>, fw@strlen.de,
 jmaloy@redhat.com, minchan@kernel.org, james.morse@arm.com,
 mcoquelin.stm32@gmail.com, jernej.skrabec@gmail.com, herve.codina@bootlin.com,
 linux@rasmusvillemoes.dk, platform-driver-x86@vger.kernel.org, clm@fb.com,
 amd-gfx@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 mgross@linux.intel.com, linux-staging@lists.linux.dev, willy@infradead.org,
 wens@csie.org, linux-input@vger.kernel.org, linux-ext4@vger.kernel.org,
 pablo@netfilter.org, rric@kernel.org, jejb@linux.ibm.com, rostedt@goodmis.org,
 bp@alien8.de, linux-hwmon@vger.kernel.org, martin.petersen@oracle.com,
 dmitry.torokhov@gmail.com, David.Laight@aculab.com, ngupta@vflare.org,
 sakari.ailus@linux.intel.com, ying.xue@windriver.com, davem@davemloft.net,
 peterz@infradead.org, linux-mm@kvack.org, adilger.kernel@dilger.ca,
 hpa@zytor.com, anton.ivanov@cambridgegreys.com, linux-scsi@vger.kernel.org,
 richard@nod.at, x86@kernel.org, mingo@redhat.com, kuba@kernel.org,
 jdike@addtoit.com, dushistov@mail.ru, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, josef@toxicpanda.com, hdegoede@redhat.com,
 dsterba@suse.com, andriy.shevchenko@linux.intel.com,
 linux-edac@vger.kernel.org, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org,
 dsahern@kernel.org, stable@vger.kernel.org, robdclark@gmail.com,
 tipc-discussion@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 tzimmermann@suse.de, maz@kernel.org, luc.vanoostenryck@gmail.com
Subject: Re: [Linux-stm32] [PATCH v2 07/19 5.15.y] minmax: simplify and
 clarify min_t()/max_t() implementation
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

T24gRnJpLCBPY3QgMDMsIDIwMjUgYXQgMTI6NTk6NTRQTSArMDAwMCwgRWxpYXYgRmFyYmVyIHdy
b3RlOgo+IEZyb206IExpbnVzIFRvcnZhbGRzIDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9y
Zz4KPiAKPiBbIFVwc3RyZWFtIGNvbW1pdCAwMTdmYTNlODkxODc4NDhmZDA1NmFmNzU3NzY5Yzll
NjZhYzNlOTNkIF0KPiAKPiBUaGlzIHNpbXBsaWZpZXMgdGhlIG1pbl90KCkgYW5kIG1heF90KCkg
bWFjcm9zIGJ5IG5vIGxvbmdlciBtYWtpbmcgdGhlbQo+IHdvcmsgaW4gdGhlIGNvbnRleHQgb2Yg
YSBDIGNvbnN0YW50IGV4cHJlc3Npb24uCj4gCj4gVGhhdCBtZWFucyB0aGF0IHlvdSBjYW4gbm8g
bG9uZ2VyIHVzZSB0aGVtIGZvciBzdGF0aWMgaW5pdGlhbGl6ZXJzIG9yCj4gZm9yIGFycmF5IHNp
emVzIGluIHR5cGUgZGVmaW5pdGlvbnMsIGJ1dCB0aGVyZSB3ZXJlIG9ubHkgYSBjb3VwbGUgb2YK
PiBzdWNoIHVzZXMsIGFuZCBhbGwgb2YgdGhlbSB3ZXJlIGNvbnZlcnRlZCAoZmFtb3VzIGxhc3Qg
d29yZHMpIHRvIHVzZQo+IE1JTl9UL01BWF9UIGluc3RlYWQuCj4gCj4gQ2M6IERhdmlkIExhaWdo
dCA8RGF2aWQuTGFpZ2h0QGFjdWxhYi5jb20+Cj4gQ2M6IExvcmVuem8gU3RvYWtlcyA8bG9yZW56
by5zdG9ha2VzQG9yYWNsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTGludXMgVG9ydmFsZHMgPHRv
cnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEVsaWF2IEZhcmJl
ciA8ZmFyYmVyZUBhbWF6b24uY29tPgoKRWxpYXYsIHlvdXIgdGVzdGluZyBpbmZyYXN0cnVjdHVy
ZSBuZWVkcyBzb21lIHdvcmssIHRoaXMgcGF0Y2ggYnJlYWtzCnRoZSBidWlsZCBvbiB0aGlzIGtl
cm5lbCB0cmVlOgoKSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4vaW5jbHVkZS9saW51eC9rZXJuZWwu
aDoxNiwKICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9saXN0Lmg6OSwKICAg
ICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC93YWl0Lmg6NywKICAgICAgICAgICAg
ICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC93YWl0X2JpdC5oOjgsCiAgICAgICAgICAgICAgICAg
ZnJvbSAuL2luY2x1ZGUvbGludXgvZnMuaDo2LAogICAgICAgICAgICAgICAgIGZyb20gZnMvZXJv
ZnMvaW50ZXJuYWwuaDoxMCwKICAgICAgICAgICAgICAgICBmcm9tIGZzL2Vyb2ZzL3pkYXRhLmg6
OSwKICAgICAgICAgICAgICAgICBmcm9tIGZzL2Vyb2ZzL3pkYXRhLmM6NjoKZnMvZXJvZnMvemRh
dGEuYzogSW4gZnVuY3Rpb24g4oCYel9lcm9mc19kZWNvbXByZXNzX3BjbHVzdGVy4oCZOgpmcy9l
cm9mcy96ZGF0YS5oOjE4NTo2MTogZXJyb3I6IElTTyBDOTAgZm9yYmlkcyB2YXJpYWJsZSBsZW5n
dGggYXJyYXkg4oCYcGFnZXNfb25zdGFja+KAmSBbLVdlcnJvcj12bGFdCiAgMTg1IHwgICAgICAg
ICBtaW5fdCh1bnNpZ25lZCBpbnQsIFRIUkVBRF9TSVpFIC8gOCAvIHNpemVvZihzdHJ1Y3QgcGFn
ZSAqKSwgOTZVKQogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF5+fn4KLi9pbmNsdWRlL2xpbnV4L21pbm1heC5oOjQ5OjIz
OiBub3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvIOKAmF9fY21wX29uY2VfdW5pcXVl4oCZCiAg
IDQ5IHwgICAgICAgICAoeyB0eXBlIHV4ID0gKHgpOyB0eXBlIHV5ID0gKHkpOyBfX2NtcChvcCwg
dXgsIHV5KTsgfSkKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgXgouL2luY2x1ZGUvbGlu
dXgvbWlubWF4Lmg6MTY0OjI3OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYX19jbXBf
b25jZeKAmQogIDE2NCB8ICNkZWZpbmUgbWluX3QodHlwZSwgeCwgeSkgX19jbXBfb25jZShtaW4s
IHR5cGUsIHgsIHkpCiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+
CmZzL2Vyb2ZzL3pkYXRhLmg6MTg1Ojk6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJht
aW5fdOKAmQogIDE4NSB8ICAgICAgICAgbWluX3QodW5zaWduZWQgaW50LCBUSFJFQURfU0laRSAv
IDggLyBzaXplb2Yoc3RydWN0IHBhZ2UgKiksIDk2VSkKICAgICAgfCAgICAgICAgIF5+fn5+CmZz
L2Vyb2ZzL3pkYXRhLmM6ODQ3OjM2OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYWl9F
Uk9GU19WTUFQX09OU1RBQ0tfUEFHRVPigJkKICA4NDcgfCAgICAgICAgIHN0cnVjdCBwYWdlICpw
YWdlc19vbnN0YWNrW1pfRVJPRlNfVk1BUF9PTlNUQUNLX1BBR0VTXTsKICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CmNj
MTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCgoKSSdsbCBkcm9wIHRoaXMg
d2hvbGUgc2VyaWVzLCBwbGVhc2UgZG8gYSBiaXQgbW9yZSB0ZXN0aW5nIGJlZm9yZSBzZW5kaW5n
Cm91dCBhIG5ldyB2ZXJzaW9uLgoKdGhhbmtzLAoKZ3JlZyBrLWgKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
