Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D6ABEE4C1
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Oct 2025 14:37:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95E2FC3FACB;
	Sun, 19 Oct 2025 12:37:46 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F79BC3F95F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Oct 2025 12:37:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 285FE604E4;
 Sun, 19 Oct 2025 12:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54864C4CEE7;
 Sun, 19 Oct 2025 12:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1760877463;
 bh=dgzA9LsGuiP/mYejoGwFkpon4M45cMihfvBvR4qrSRg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mr7tZ637v1WDh2Nr8sg19/xoeGzZL3RvlnXfYUykPJk+G6zQteton6Oo+u5wVdnxN
 ZBC8QPSBVC5hJfXNWgutJHN6QRJ4bxeGe2+hYWxIp2brHCNu/KXcKMeG5P43CM4Fjg
 vDPDOANq6idL2020QoIIUuWRPKXTuhm7Nf2n5Cxw=
Date: Sun, 19 Oct 2025 14:37:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Farber, Eliav" <farbere@amazon.com>
Message-ID: <2025101929-curator-poplar-7460@gregkh>
References: <20251017090519.46992-1-farbere@amazon.com>
 <2025101704-rumble-chatroom-60b5@gregkh>
 <CH0PR18MB5433BB2E99395D2AC8B0E0FBC6F7A@CH0PR18MB5433.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH0PR18MB5433BB2E99395D2AC8B0E0FBC6F7A@CH0PR18MB5433.namprd18.prod.outlook.com>
Cc: "snitzer@redhat.com" <snitzer@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "malattia@linux.it" <malattia@linux.it>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "sashal@kernel.org" <sashal@kernel.org>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "kadlec@netfilter.org" <kadlec@netfilter.org>,
 "linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "pmladek@suse.com" <pmladek@suse.com>, "jdelvare@suse.com" <jdelvare@suse.com>,
 "intel-linux-scu@intel.com" <intel-linux-scu@intel.com>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "luto@kernel.org" <luto@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "sean@poorly.run" <sean@poorly.run>,
 "qiuxu.zhuo@intel.com" <qiuxu.zhuo@intel.com>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netfilter-devel@vger.kernel.org" <netfilter-devel@vger.kernel.org>,
 "jack@suse.com" <jack@suse.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "Jason@zx2c4.com" <Jason@zx2c4.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "mihail.atanassov@arm.com" <mihail.atanassov@arm.com>,
 "agk@redhat.com" <agk@redhat.com>,
 "ruanjinjie@huawei.com" <ruanjinjie@huawei.com>,
 "coreteam@netfilter.org" <coreteam@netfilter.org>,
 "james.qian.wang@arm.com" <james.qian.wang@arm.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "evan.quan@amd.com" <evan.quan@amd.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "tony.luck@intel.com" <tony.luck@intel.com>, "tytso@mit.edu" <tytso@mit.edu>,
 "fw@strlen.de" <fw@strlen.de>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "jmaloy@redhat.com" <jmaloy@redhat.com>,
 "minchan@kernel.org" <minchan@kernel.org>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "brian.starkey@arm.com" <brian.starkey@arm.com>,
 "herve.codina@bootlin.com" <herve.codina@bootlin.com>,
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "clm@fb.com" <clm@fb.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "willy@infradead.org" <willy@infradead.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "kuznet@ms2.inr.ac.ru" <kuznet@ms2.inr.ac.ru>,
 "xiang@kernel.org" <xiang@kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "pablo@netfilter.org" <pablo@netfilter.org>,
 "rric@kernel.org" <rric@kernel.org>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "nathan@kernel.org" <nathan@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "kbusch@kernel.org" <kbusch@kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "fery@cypress.com" <fery@cypress.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
 "David.Laight@aculab.com" <David.Laight@aculab.com>,
 "ngupta@vflare.org" <ngupta@vflare.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "ying.xue@windriver.com" <ying.xue@windriver.com>,
 "linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "liviu.dudau@arm.com" <liviu.dudau@arm.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "artur.paszkiewicz@intel.com" <artur.paszkiewicz@intel.com>,
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "anton.ivanov@cambridgegreys.com" <anton.ivanov@cambridgegreys.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "richard@nod.at" <richard@nod.at>, "x86@kernel.org" <x86@kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "mingo@redhat.com" <mingo@redhat.com>, "kuba@kernel.org" <kuba@kernel.org>,
 "jdike@addtoit.com" <jdike@addtoit.com>,
 "dushistov@mail.ru" <dushistov@mail.ru>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "chao@kernel.org" <chao@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "josef@toxicpanda.com" <josef@toxicpanda.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "dsterba@suse.com" <dsterba@suse.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 "yoshfuji@linux-ipv6.org" <yoshfuji@linux-ipv6.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "sergey.senozhatsky@gmail.com" <sergey.senozhatsky@gmail.com>,
 "robdclark@gmail.com" <robdclark@gmail.com>,
 "tipc-discussion@lists.sourceforge.net"
 <tipc-discussion@lists.sourceforge.net>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "rajur@chelsio.com" <rajur@chelsio.com>,
 "luc.vanoostenryck@gmail.com" <luc.vanoostenryck@gmail.com>
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

T24gU2F0LCBPY3QgMTgsIDIwMjUgYXQgMDg6MDc6MzJQTSArMDAwMCwgRmFyYmVyLCBFbGlhdiB3
cm90ZToKPiA+IE9uIEZyaSwgT2N0IDE3LCAyMDI1IGF0IDA5OjA0OjUyQU0gKzAwMDAsIEVsaWF2
IEZhcmJlciB3cm90ZToKPiA+ID4gVGhpcyBzZXJpZXMgYmFja3BvcnRzIDI3IHBhdGNoZXMgdG8g
dXBkYXRlIG1pbm1heC5oIGluIHRoZSA1LjEwLnkKPiA+ID4gYnJhbmNoLCBhbGlnbmluZyBpdCB3
aXRoIHY2LjE3LXJjNy4KPiA+ID4KPiA+ID4gVGhlIHVsdGltYXRlIGdvYWwgaXMgdG8gc3luY2hy
b25pemUgYWxsIGxvbmctdGVybSBicmFuY2hlcyBzbyB0aGF0IHRoZXkKPiA+ID4gaW5jbHVkZSB0
aGUgZnVsbCBzZXQgb2YgbWlubWF4LmggY2hhbmdlcy4KPiA+ID4KPiA+ID4gLSA2LjEyLnkgaGFz
IGFscmVhZHkgYmVlbiBiYWNrcG9ydGVkOyB0aGUgY2hhbmdlcyBhcmUgaW5jbHVkZWQgaW4KPiA+
ID4gICB2Ni4xMi40OS4KPiA+ID4gLSA2LjYueSBoYXMgYWxyZWFkeSBiZWVuIGJhY2twb3J0ZWQ7
IHRoZSBjaGFuZ2VzIGFyZSBpbmNsdWRlZCBpbgo+ID4gPiAgIHY2LjYuMTA5Lgo+ID4gPiAtIDYu
MS55IGhhcyBhbHJlYWR5IGJlZW4gYmFja3BvcnRlZDsgdGhlIGNoYW5nZXMgYXJlIGN1cnJlbnRs
eSBpbiB0aGUKPiA+ID4gICA2LjEtc3RhYmxlIHRyZWUuCj4gPiA+IC0gNS4xNS55IGhhcyBhbHJl
YWR5IGJlZW4gYmFja3BvcnRlZDsgdGhlIGNoYW5nZXMgYXJlIGN1cnJlbnRseSBpbiB0aGUKPiA+
ID4gICA1LjE1LXN0YWJsZSB0cmVlLgo+ID4KPiA+IFdpdGggdGhpcyBzZXJpZXMgYXBwbGllZCwg
b24gYW4gYXJtNjQgc2VydmVyLCBidWlsZGluZyAnYWxsbW9kY29uZmlnJywgSQo+ID4gZ2V0IHRo
ZSBmb2xsb3dpbmcgYnVpbGQgZXJyb3IuCj4gPgo+ID4gT2RkbHkgSSBkb24ndCBzZWUgaXQgb24g
bXkgeDg2IHNlcnZlciwgcGVyaGFwcyBkdWUgdG8gZGlmZmVyZW50IGNvbXBpbGVyCj4gPiB2ZXJz
aW9ucz8KPiA+Cj4gPiBBbnkgaWRlYXM/Cj4gCj4gVGhpcyBtYWlubGluZSBjb21taXQgaXMgbWlz
c2luZzoKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90
b3J2YWxkcy9saW51eC5naXQvY29tbWl0L2RyaXZlcnMvbmV0L3dpcmVsZXNzL3JhbGluay9ydDJ4
MDAvcnQyODAwbGliLmM/aD12Ni4xOC1yYzEmaWQ9NjYwNjMwMzNmNzdlMTBiOTg1MjU4MTI2YTk3
NTczZjg0YmI4ZDNiNAo+IAo+IFRoaXMgZml4IGFscmVhZHkgZXhpc3RzIGluIDUuMTUueToKPiBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGlu
dXguZ2l0L2NvbW1pdC9kcml2ZXJzL25ldC93aXJlbGVzcy9yYWxpbmsvcnQyeDAwL3J0MjgwMGxp
Yi5jP2g9djUuMTUuMTk0JmlkPTJkM2NlZjNkN2E1ZGYyNjBhMTRhNjY3OWM0YWNhMGM5N2U1NzBl
ZTUKPiDigKZidXQgaXMgbWlzc2luZyBpbiA1LjEwLnkuCj4gCj4gSSBub3cgYmFja3BvcnRlZCBp
dCB0byA1LjEwLnkgaGVyZToKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9zdGFibGUvMjAyNTEw
MTgxOTU5NDUuMTg4MjUtMS1mYXJiZXJlQGFtYXpvbi5jb20vVC8jdQoKVGhhbmtzLEkndmUgcXVl
dWVkIHRoYXQgdXAgbm93LgoKZ3JlZyBrLWgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
