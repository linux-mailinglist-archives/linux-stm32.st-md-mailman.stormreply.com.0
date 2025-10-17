Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7E5BEA7E3
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Oct 2025 18:09:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F703C597BB;
	Fri, 17 Oct 2025 16:09:53 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 808D0C597A8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 16:09:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 19A6443AD4;
 Fri, 17 Oct 2025 16:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE17C4CEE7;
 Fri, 17 Oct 2025 16:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760717391;
 bh=BOrYC+tXjLjRqJyXcD4crvrBNK2lkUpKkjfEmyc87bI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YtSviiKK7XhOypmn1B0JMTFJNg+aK9xkicr5kleBJoGLQsIHX6oRtRnPJgXbXWtLH
 cVrvwZYIhcft0nkxK/ZQBpXxxHeWHw5/VEilYnGTD4lEZyzXP8wqDKjbklEc7PQZxX
 jrw7mNWuagcjs3SnKes4mzFKMKH2tiSDMTY+zRgHS/b+KVlZKnLK4gb6spqja1+1F5
 LtRKkkOtABvH8jmUIF+maywb5ma9DVPFdB4So5FQ7XdD3Y3FN97CNzQWMZICjSRgyi
 XbXdYmBkEWUiq556ItdRa+tvmxGUk+V9ozsqtDgWFGhyHQtvMVM573eif+FMsCQ1J7
 ilRe5q/VN9eDQ==
Date: Fri, 17 Oct 2025 17:09:24 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20251017160924.GA2728735@ax162>
References: <20251017090519.46992-1-farbere@amazon.com>
 <2025101704-rumble-chatroom-60b5@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2025101704-rumble-chatroom-60b5@gregkh>
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

T24gRnJpLCBPY3QgMTcsIDIwMjUgYXQgMDU6MDM6MDJQTSArMDIwMCwgR3JlZyBLSCB3cm90ZToK
PiBPbiBGcmksIE9jdCAxNywgMjAyNSBhdCAwOTowNDo1MkFNICswMDAwLCBFbGlhdiBGYXJiZXIg
d3JvdGU6Cj4gPiBUaGlzIHNlcmllcyBiYWNrcG9ydHMgMjcgcGF0Y2hlcyB0byB1cGRhdGUgbWlu
bWF4LmggaW4gdGhlIDUuMTAueQo+ID4gYnJhbmNoLCBhbGlnbmluZyBpdCB3aXRoIHY2LjE3LXJj
Ny4KPiA+IAo+ID4gVGhlIHVsdGltYXRlIGdvYWwgaXMgdG8gc3luY2hyb25pemUgYWxsIGxvbmct
dGVybSBicmFuY2hlcyBzbyB0aGF0IHRoZXkKPiA+IGluY2x1ZGUgdGhlIGZ1bGwgc2V0IG9mIG1p
bm1heC5oIGNoYW5nZXMuCj4gPiAKPiA+IC0gNi4xMi55IGhhcyBhbHJlYWR5IGJlZW4gYmFja3Bv
cnRlZDsgdGhlIGNoYW5nZXMgYXJlIGluY2x1ZGVkIGluCj4gPiAgIHY2LjEyLjQ5Lgo+ID4gLSA2
LjYueSBoYXMgYWxyZWFkeSBiZWVuIGJhY2twb3J0ZWQ7IHRoZSBjaGFuZ2VzIGFyZSBpbmNsdWRl
ZCBpbgo+ID4gICB2Ni42LjEwOS4KPiA+IC0gNi4xLnkgaGFzIGFscmVhZHkgYmVlbiBiYWNrcG9y
dGVkOyB0aGUgY2hhbmdlcyBhcmUgY3VycmVudGx5IGluIHRoZQo+ID4gICA2LjEtc3RhYmxlIHRy
ZWUuCj4gPiAtIDUuMTUueSBoYXMgYWxyZWFkeSBiZWVuIGJhY2twb3J0ZWQ7IHRoZSBjaGFuZ2Vz
IGFyZSBjdXJyZW50bHkgaW4gdGhlCj4gPiAgIDUuMTUtc3RhYmxlIHRyZWUuCj4gCj4gV2l0aCB0
aGlzIHNlcmllcyBhcHBsaWVkLCBvbiBhbiBhcm02NCBzZXJ2ZXIsIGJ1aWxkaW5nICdhbGxtb2Rj
b25maWcnLCBJCj4gZ2V0IHRoZSBmb2xsb3dpbmcgYnVpbGQgZXJyb3IuCj4gCj4gT2RkbHkgSSBk
b24ndCBzZWUgaXQgb24gbXkgeDg2IHNlcnZlciwgcGVyaGFwcyBkdWUgdG8gZGlmZmVyZW50IGNv
bXBpbGVyCj4gdmVyc2lvbnM/Cj4gCj4gQW55IGlkZWFzPwo+IAo+IHRoYW5rcywKPiAKPiBncmVn
IGstaAo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IAo+IEluIGZ1bmN0aW9uIOKAmHJ0
MjgwMF90eHBvd2VyX3RvX2RlduKAmSwKPiAgICAgaW5saW5lZCBmcm9tIOKAmHJ0MjgwMF9jb25m
aWdfY2hhbm5lbOKAmSBhdCAuLi9kcml2ZXJzL25ldC93aXJlbGVzcy9yYWxpbmsvcnQyeDAwL3J0
MjgwMGxpYi5jOjQwMjI6MjU6Cj4gLi8uLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5cGVzLmg6
MzA5OjQ1OiBlcnJvcjogY2FsbCB0byDigJhfX2NvbXBpbGV0aW1lX2Fzc2VydF8xMTY44oCZIGRl
Y2xhcmVkIHdpdGggYXR0cmlidXRlIGVycm9yOiBjbGFtcCgpIGxvdyBsaW1pdCAtNyBncmVhdGVy
IHRoYW4gaGlnaCBsaW1pdCAxNQo+ICAgMzA5IHwgICAgICAgICBfY29tcGlsZXRpbWVfYXNzZXJ0
KGNvbmRpdGlvbiwgbXNnLCBfX2NvbXBpbGV0aW1lX2Fzc2VydF8sIF9fQ09VTlRFUl9fKQo+ICAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gLi8u
Li9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5cGVzLmg6MjkwOjI1OiBub3RlOiBpbiBkZWZpbml0
aW9uIG9mIG1hY3JvIOKAmF9fY29tcGlsZXRpbWVfYXNzZXJ04oCZCj4gICAyOTAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICBwcmVmaXggIyMgc3VmZml4KCk7ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn4KPiAuLy4u
L2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaDozMDk6OTogbm90ZTogaW4gZXhwYW5zaW9u
IG9mIG1hY3JvIOKAmF9jb21waWxldGltZV9hc3NlcnTigJkKPiAgIDMwOSB8ICAgICAgICAgX2Nv
bXBpbGV0aW1lX2Fzc2VydChjb25kaXRpb24sIG1zZywgX19jb21waWxldGltZV9hc3NlcnRfLCBf
X0NPVU5URVJfXykKPiAgICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fgo+IC4uL2lu
Y2x1ZGUvbGludXgvYnVpbGRfYnVnLmg6Mzk6Mzc6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNy
byDigJhjb21waWxldGltZV9hc3NlcnTigJkKPiAgICAzOSB8ICNkZWZpbmUgQlVJTERfQlVHX09O
X01TRyhjb25kLCBtc2cpIGNvbXBpbGV0aW1lX2Fzc2VydCghKGNvbmQpLCBtc2cpCj4gICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn4K
PiAuLi9pbmNsdWRlL2xpbnV4L21pbm1heC5oOjE4ODo5OiBub3RlOiBpbiBleHBhbnNpb24gb2Yg
bWFjcm8g4oCYQlVJTERfQlVHX09OX01TR+KAmQo+ICAgMTg4IHwgICAgICAgICBCVUlMRF9CVUdf
T05fTVNHKHN0YXRpY2FsbHlfdHJ1ZSh1bG8gPiB1aGkpLCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4KPiAuLi9pbmNsdWRlL2xp
bnV4L21pbm1heC5oOjE5NTo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYX19jbGFt
cF9vbmNl4oCZCj4gICAxOTUgfCAgICAgICAgIF9fY2xhbXBfb25jZSh0eXBlLCB2YWwsIGxvLCBo
aSwgX19VTklRVUVfSUQodl8pLCBfX1VOSVFVRV9JRChsXyksIF9fVU5JUVVFX0lEKGhfKSkKPiAg
ICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+Cj4gLi4vaW5jbHVkZS9saW51eC9taW5tYXguaDoy
MTg6MzY6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhfX2NhcmVmdWxfY2xhbXDigJkK
PiAgIDIxOCB8ICNkZWZpbmUgY2xhbXBfdCh0eXBlLCB2YWwsIGxvLCBoaSkgX19jYXJlZnVsX2Ns
YW1wKHR5cGUsIHZhbCwgbG8sIGhpKQo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBefn5+fn5+fn5+fn5+fn4KPiAuLi9kcml2ZXJzL25ldC93aXJlbGVzcy9yYWxp
bmsvcnQyeDAwL3J0MjgwMGxpYi5jOjM5ODA6MjQ6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNy
byDigJhjbGFtcF904oCZCj4gIDM5ODAgfCAgICAgICAgICAgICAgICAgcmV0dXJuIGNsYW1wX3Qo
Y2hhciwgdHhwb3dlciwgTUlOX0FfVFhQT1dFUiwgTUFYX0FfVFhQT1dFUik7Cj4gICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn4KCk1pc3NpbmcgY29tbWl0IDNiYzc1M2MwNmRk
MCAoImtidWlsZDogdHJlYXQgY2hhciBhcyBhbHdheXMgdW5zaWduZWQiKT8KCkNoZWVycywKTmF0
aGFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
