Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01249BEE4F7
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Oct 2025 14:38:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B95E1C57B70;
	Sun, 19 Oct 2025 12:38:33 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A465C3FACB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Oct 2025 12:38:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 408344079E;
 Sun, 19 Oct 2025 12:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2363C4CEE7;
 Sun, 19 Oct 2025 12:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1760877510;
 bh=oGwiDB09ge0ciPiwd9WRh3Y/M8CeD9dHfclvYoY7FBA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nPSmMhj3TEXZoJrVWpARUkUyuGqk5lSFTPPoq1ZLeK3fCa9fne3RGlMO8KN1UE5lj
 ujRuOzzKq00FxR8F6wzbmtZQ/5O3ZNw8lG3lB3NfHxm+YwEDzwS2JsXmf0Ca6p4Frl
 ca5FOfnjYZ+gRAebgpsYtYTlOl8nww3/qAlyQSN0=
Date: Sun, 19 Oct 2025 14:38:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Message-ID: <2025101905-matter-freezable-39e5@gregkh>
References: <20251017090519.46992-1-farbere@amazon.com>
 <2025101704-rumble-chatroom-60b5@gregkh>
 <20251017160924.GA2728735@ax162>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251017160924.GA2728735@ax162>
Cc: snitzer@redhat.com, dri-devel@lists.freedesktop.org, malattia@linux.it,
 linux-stm32@st-md-mailman.stormreply.com, sashal@kernel.org,
 bvanassche@acm.org, Eliav Farber <farbere@amazon.com>, kadlec@netfilter.org,
 linux-sparse@vger.kernel.org, joabreu@synopsys.com, linux@roeck-us.net,
 pmladek@suse.com, jdelvare@suse.com, intel-linux-scu@intel.com,
 sunpeng.li@amd.com, linux-um@lists.infradead.org, luto@kernel.org,
 tglx@linutronix.de, sean@poorly.run, qiuxu.zhuo@intel.com,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, jack@suse.com, alexander.deucher@amd.com,
 akpm@linux-foundation.org, freedreno@lists.freedesktop.org, Jason@zx2c4.com,
 airlied@linux.ie, dave.hansen@linux.intel.com, dm-devel@redhat.com,
 mihail.atanassov@arm.com, agk@redhat.com, ruanjinjie@huawei.com,
 coreteam@netfilter.org, james.qian.wang@arm.com, linux-media@vger.kernel.org,
 alexandre.torgue@st.com, linux-arm-msm@vger.kernel.org, mripard@kernel.org,
 peppe.cavallaro@st.com, evan.quan@amd.com,
 linux-arm-kernel@lists.infradead.org, tony.luck@intel.com, tytso@mit.edu,
 fw@strlen.de, christian.koenig@amd.com, jmaloy@redhat.com, minchan@kernel.org,
 james.morse@arm.com, mcoquelin.stm32@gmail.com, brian.starkey@arm.com,
 herve.codina@bootlin.com, linux@rasmusvillemoes.dk,
 platform-driver-x86@vger.kernel.org, clm@fb.com, amd-gfx@lists.freedesktop.org,
 mgross@linux.intel.com, linux-staging@lists.linux.dev, willy@infradead.org,
 linux-input@vger.kernel.org, kuznet@ms2.inr.ac.ru, xiang@kernel.org,
 linux-ext4@vger.kernel.org, harry.wentland@amd.com, pablo@netfilter.org,
 rric@kernel.org, keescook@chromium.org, jejb@linux.ibm.com,
 rostedt@goodmis.org, bp@alien8.de, kbusch@kernel.org, mchehab@kernel.org,
 linux-hwmon@vger.kernel.org, fery@cypress.com, martin.petersen@oracle.com,
 dmitry.torokhov@gmail.com, David.Laight@aculab.com, ngupta@vflare.org,
 sakari.ailus@linux.intel.com, ying.xue@windriver.com,
 linux-erofs@lists.ozlabs.org, davem@davemloft.net, peterz@infradead.org,
 liviu.dudau@arm.com, linux-mm@kvack.org, artur.paszkiewicz@intel.com,
 adilger.kernel@dilger.ca, hpa@zytor.com, anton.ivanov@cambridgegreys.com,
 linux-scsi@vger.kernel.org, richard@nod.at, x86@kernel.org,
 linux@armlinux.org.uk, mingo@redhat.com, kuba@kernel.org, jdike@addtoit.com,
 dushistov@mail.ru, daniel@ffwll.ch, chao@kernel.org,
 maarten.lankhorst@linux.intel.com, josef@toxicpanda.com, hdegoede@redhat.com,
 dsterba@suse.com, andriy.shevchenko@linux.intel.com,
 linux-edac@vger.kernel.org, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org,
 stable@vger.kernel.org, sergey.senozhatsky@gmail.com, robdclark@gmail.com,
 tipc-discussion@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 tzimmermann@suse.de, rajur@chelsio.com, luc.vanoostenryck@gmail.com
Subject: Re: [Linux-stm32] [PATCH v2 00/27 5.10.y] Backport minmax.h updates
	from v6.17-rc7
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

T24gRnJpLCBPY3QgMTcsIDIwMjUgYXQgMDU6MDk6MjRQTSArMDEwMCwgTmF0aGFuIENoYW5jZWxs
b3Igd3JvdGU6Cj4gT24gRnJpLCBPY3QgMTcsIDIwMjUgYXQgMDU6MDM6MDJQTSArMDIwMCwgR3Jl
ZyBLSCB3cm90ZToKPiA+IE9uIEZyaSwgT2N0IDE3LCAyMDI1IGF0IDA5OjA0OjUyQU0gKzAwMDAs
IEVsaWF2IEZhcmJlciB3cm90ZToKPiA+ID4gVGhpcyBzZXJpZXMgYmFja3BvcnRzIDI3IHBhdGNo
ZXMgdG8gdXBkYXRlIG1pbm1heC5oIGluIHRoZSA1LjEwLnkKPiA+ID4gYnJhbmNoLCBhbGlnbmlu
ZyBpdCB3aXRoIHY2LjE3LXJjNy4KPiA+ID4gCj4gPiA+IFRoZSB1bHRpbWF0ZSBnb2FsIGlzIHRv
IHN5bmNocm9uaXplIGFsbCBsb25nLXRlcm0gYnJhbmNoZXMgc28gdGhhdCB0aGV5Cj4gPiA+IGlu
Y2x1ZGUgdGhlIGZ1bGwgc2V0IG9mIG1pbm1heC5oIGNoYW5nZXMuCj4gPiA+IAo+ID4gPiAtIDYu
MTIueSBoYXMgYWxyZWFkeSBiZWVuIGJhY2twb3J0ZWQ7IHRoZSBjaGFuZ2VzIGFyZSBpbmNsdWRl
ZCBpbgo+ID4gPiAgIHY2LjEyLjQ5Lgo+ID4gPiAtIDYuNi55IGhhcyBhbHJlYWR5IGJlZW4gYmFj
a3BvcnRlZDsgdGhlIGNoYW5nZXMgYXJlIGluY2x1ZGVkIGluCj4gPiA+ICAgdjYuNi4xMDkuCj4g
PiA+IC0gNi4xLnkgaGFzIGFscmVhZHkgYmVlbiBiYWNrcG9ydGVkOyB0aGUgY2hhbmdlcyBhcmUg
Y3VycmVudGx5IGluIHRoZQo+ID4gPiAgIDYuMS1zdGFibGUgdHJlZS4KPiA+ID4gLSA1LjE1Lnkg
aGFzIGFscmVhZHkgYmVlbiBiYWNrcG9ydGVkOyB0aGUgY2hhbmdlcyBhcmUgY3VycmVudGx5IGlu
IHRoZQo+ID4gPiAgIDUuMTUtc3RhYmxlIHRyZWUuCj4gPiAKPiA+IFdpdGggdGhpcyBzZXJpZXMg
YXBwbGllZCwgb24gYW4gYXJtNjQgc2VydmVyLCBidWlsZGluZyAnYWxsbW9kY29uZmlnJywgSQo+
ID4gZ2V0IHRoZSBmb2xsb3dpbmcgYnVpbGQgZXJyb3IuCj4gPiAKPiA+IE9kZGx5IEkgZG9uJ3Qg
c2VlIGl0IG9uIG15IHg4NiBzZXJ2ZXIsIHBlcmhhcHMgZHVlIHRvIGRpZmZlcmVudCBjb21waWxl
cgo+ID4gdmVyc2lvbnM/Cj4gPiAKPiA+IEFueSBpZGVhcz8KPiA+IAo+ID4gdGhhbmtzLAo+ID4g
Cj4gPiBncmVnIGstaAo+ID4gCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+IAo+ID4g
SW4gZnVuY3Rpb24g4oCYcnQyODAwX3R4cG93ZXJfdG9fZGV24oCZLAo+ID4gICAgIGlubGluZWQg
ZnJvbSDigJhydDI4MDBfY29uZmlnX2NoYW5uZWzigJkgYXQgLi4vZHJpdmVycy9uZXQvd2lyZWxl
c3MvcmFsaW5rL3J0MngwMC9ydDI4MDBsaWIuYzo0MDIyOjI1Ogo+ID4gLi8uLi9pbmNsdWRlL2xp
bnV4L2NvbXBpbGVyX3R5cGVzLmg6MzA5OjQ1OiBlcnJvcjogY2FsbCB0byDigJhfX2NvbXBpbGV0
aW1lX2Fzc2VydF8xMTY44oCZIGRlY2xhcmVkIHdpdGggYXR0cmlidXRlIGVycm9yOiBjbGFtcCgp
IGxvdyBsaW1pdCAtNyBncmVhdGVyIHRoYW4gaGlnaCBsaW1pdCAxNQo+ID4gICAzMDkgfCAgICAg
ICAgIF9jb21waWxldGltZV9hc3NlcnQoY29uZGl0aW9uLCBtc2csIF9fY29tcGlsZXRpbWVfYXNz
ZXJ0XywgX19DT1VOVEVSX18pCj4gPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXgo+ID4gLi8uLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5cGVz
Lmg6MjkwOjI1OiBub3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvIOKAmF9fY29tcGlsZXRpbWVf
YXNzZXJ04oCZCj4gPiAgIDI5MCB8ICAgICAgICAgICAgICAgICAgICAgICAgIHByZWZpeCAjIyBz
dWZmaXgoKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgXn5+fn5+Cj4gPiAuLy4uL2luY2x1ZGUvbGludXgvY29tcGlsZXJf
dHlwZXMuaDozMDk6OTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmF9jb21waWxldGlt
ZV9hc3NlcnTigJkKPiA+ICAgMzA5IHwgICAgICAgICBfY29tcGlsZXRpbWVfYXNzZXJ0KGNvbmRp
dGlvbiwgbXNnLCBfX2NvbXBpbGV0aW1lX2Fzc2VydF8sIF9fQ09VTlRFUl9fKQo+ID4gICAgICAg
fCAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn4KPiA+IC4uL2luY2x1ZGUvbGludXgvYnVpbGRf
YnVnLmg6Mzk6Mzc6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhjb21waWxldGltZV9h
c3NlcnTigJkKPiA+ICAgIDM5IHwgI2RlZmluZSBCVUlMRF9CVUdfT05fTVNHKGNvbmQsIG1zZykg
Y29tcGlsZXRpbWVfYXNzZXJ0KCEoY29uZCksIG1zZykKPiA+ICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+Cj4gPiAuLi9pbmNsdWRl
L2xpbnV4L21pbm1heC5oOjE4ODo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYQlVJ
TERfQlVHX09OX01TR+KAmQo+ID4gICAxODggfCAgICAgICAgIEJVSUxEX0JVR19PTl9NU0coc3Rh
dGljYWxseV90cnVlKHVsbyA+IHVoaSksICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+
ICAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+Cj4gPiAuLi9pbmNsdWRlL2xpbnV4L21p
bm1heC5oOjE5NTo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYX19jbGFtcF9vbmNl
4oCZCj4gPiAgIDE5NSB8ICAgICAgICAgX19jbGFtcF9vbmNlKHR5cGUsIHZhbCwgbG8sIGhpLCBf
X1VOSVFVRV9JRCh2XyksIF9fVU5JUVVFX0lEKGxfKSwgX19VTklRVUVfSUQoaF8pKQo+ID4gICAg
ICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fgo+ID4gLi4vaW5jbHVkZS9saW51eC9taW5tYXguaDoy
MTg6MzY6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhfX2NhcmVmdWxfY2xhbXDigJkK
PiA+ICAgMjE4IHwgI2RlZmluZSBjbGFtcF90KHR5cGUsIHZhbCwgbG8sIGhpKSBfX2NhcmVmdWxf
Y2xhbXAodHlwZSwgdmFsLCBsbywgaGkpCj4gPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+Cj4gPiAuLi9kcml2ZXJzL25ldC93aXJlbGVz
cy9yYWxpbmsvcnQyeDAwL3J0MjgwMGxpYi5jOjM5ODA6MjQ6IG5vdGU6IGluIGV4cGFuc2lvbiBv
ZiBtYWNybyDigJhjbGFtcF904oCZCj4gPiAgMzk4MCB8ICAgICAgICAgICAgICAgICByZXR1cm4g
Y2xhbXBfdChjaGFyLCB0eHBvd2VyLCBNSU5fQV9UWFBPV0VSLCBNQVhfQV9UWFBPV0VSKTsKPiA+
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+Cj4gCj4gTWlzc2luZyBjb21t
aXQgM2JjNzUzYzA2ZGQwICgia2J1aWxkOiB0cmVhdCBjaGFyIGFzIGFsd2F5cyB1bnNpZ25lZCIp
PwoKVGhhdCdzIGdvaW5nIHRvIGJlIG1lc3N5IHRvIGJhY2twb3J0LCBpdCdzIG5vdCBldmVuIGlu
IDYuMS55LCBzbyBsZXQncwpsZWF2ZSB0aGF0IGFsb25lIGlmIGF0IGFsbCBwb3NzaWJsZS4KCnRo
YW5rcywKCmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
