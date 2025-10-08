Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79376BC59A9
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Oct 2025 17:31:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DD8CC5559C;
	Wed,  8 Oct 2025 15:31:46 +0000 (UTC)
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com
 (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com
 [52.13.214.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B17FC55599
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Oct 2025 15:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
 t=1759937504; x=1791473504;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HHo5PWe4LtvHDjkJQgFRKiGpts4xHP/caZrRDmAGqn0=;
 b=CHSYNIOZpZ6lMmouKS5Pn/P4RF4OM6Ke473t72ZpY7YExitvsqgWIDj8
 o6HGhwzQnjP/USOqQF2mIZWmCUHysK3xki4czXFKrb/yJvwyCzRyDorxg
 KeFtRCmK/xY+iFKu8OwS3tJZWktmRBWlbvl2B3HAX+debEYj4AZYtKCHw
 zxl6g5JZwC/l7hurHL1DsfEc7LWWabz9iLSmYeu5PzN4oif+ui5NLgJRp
 RzvbK0Yx9FayjRcbNJyCUss1j8e+DfxbRz/kIV4RmFK4OLzDg25sKa/wW
 IpZMH8v+vww2egzPpKkU+icTrXROHY5yZ8WksuyDtNTUv4ZkyNmogQivS w==;
X-CSE-ConnectionGUID: qOunANGnQdCOJtYflWxMdA==
X-CSE-MsgGUID: o8RG+11STU2/PSRYpbgbGw==
X-IronPort-AV: E=Sophos;i="6.19,213,1754956800"; 
   d="scan'208";a="4531225"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO
 smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
 by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 15:31:41 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.21.151:52437]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.57.112:2525]
 with esmtp (Farcaster)
 id 1e7fe95c-108c-4ec7-ac08-fab91a63a8ba; Wed, 8 Oct 2025 15:31:41 +0000 (UTC)
X-Farcaster-Flow-ID: 1e7fe95c-108c-4ec7-ac08-fab91a63a8ba
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Wed, 8 Oct 2025 15:31:37 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Wed, 8 Oct 2025
 15:31:24 +0000
From: Eliav Farber <farbere@amazon.com>
To: <gregkh@linuxfoundation.org>, <jdike@addtoit.com>, <richard@nod.at>,
 <anton.ivanov@cambridgegreys.com>, <dave.hansen@linux.intel.com>,
 <luto@kernel.org>, <peterz@infradead.org>, <tglx@linutronix.de>,
 <mingo@redhat.com>, <bp@alien8.de>, <x86@kernel.org>, <hpa@zytor.com>,
 <tony.luck@intel.com>, <qiuxu.zhuo@intel.com>, <james.morse@arm.com>,
 <rric@kernel.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robdclark@gmail.com>, <sean@poorly.run>,
 <jdelvare@suse.com>, <linux@roeck-us.net>, <linus.walleij@linaro.org>,
 <dmitry.torokhov@gmail.com>, <maz@kernel.org>, <wens@csie.org>,
 <jernej.skrabec@gmail.com>, <agk@redhat.com>, <snitzer@redhat.com>,
 <dm-devel@redhat.com>, <davem@davemloft.net>, <kuba@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <krzysztof.kozlowski@canonical.com>,
 <malattia@linux.it>, <hdegoede@redhat.com>, <mgross@linux.intel.com>,
 <jejb@linux.ibm.com>, <martin.petersen@oracle.com>,
 <sakari.ailus@linux.intel.com>, <clm@fb.com>, <josef@toxicpanda.com>,
 <dsterba@suse.com>, <jack@suse.com>, <tytso@mit.edu>,
 <adilger.kernel@dilger.ca>, <dushistov@mail.ru>,
 <luc.vanoostenryck@gmail.com>, <rostedt@goodmis.org>, <pmladek@suse.com>,
 <senozhatsky@chromium.org>, <andriy.shevchenko@linux.intel.com>,
 <linux@rasmusvillemoes.dk>, <minchan@kernel.org>, <ngupta@vflare.org>,
 <akpm@linux-foundation.org>, <yoshfuji@linux-ipv6.org>, <dsahern@kernel.org>, 
 <pablo@netfilter.org>, <kadlec@netfilter.org>, <fw@strlen.de>,
 <jmaloy@redhat.com>, <ying.xue@windriver.com>, <shuah@kernel.org>,
 <willy@infradead.org>, <farbere@amazon.com>, <sashal@kernel.org>,
 <quic_akhilpo@quicinc.com>, <ruanjinjie@huawei.com>,
 <David.Laight@ACULAB.COM>, <herve.codina@bootlin.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-um@lists.infradead.org>, <linux-edac@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <linux-hwmon@vger.kernel.org>, <linux-input@vger.kernel.org>,
 <linux-sunxi@lists.linux.dev>, <linux-media@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-btrfs@vger.kernel.org>,
 <linux-ext4@vger.kernel.org>, <linux-sparse@vger.kernel.org>,
 <linux-mm@kvack.org>, <netfilter-devel@vger.kernel.org>,
 <coreteam@netfilter.org>, <tipc-discussion@lists.sourceforge.net>,
 <linux-kselftest@vger.kernel.org>, <stable@vger.kernel.org>
Date: Wed, 8 Oct 2025 15:29:31 +0000
Message-ID: <20251008152946.29285-7-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251008152946.29285-1-farbere@amazon.com>
References: <20251008152946.29285-1-farbere@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D037UWC003.ant.amazon.com (10.13.139.231) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Cc: David Laight <David.Laight@aculab.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: [Linux-stm32] [PATCH v3 06/19 5.15.y] minmax: add a few more
	MIN_T/MAX_T users
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

RnJvbTogTGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPgoKWyBV
cHN0cmVhbSBjb21taXQgNDQ3N2IzOWMzMmZkYzAzMzYzYWZmZWY0YjExZDQ4MzkxZTZkYzlmZiBd
CgpDb21taXQgM2E3ZTAyYzA0MGIxICgibWlubWF4OiBhdm9pZCBvdmVybHkgY29tcGxpY2F0ZWQg
Y29uc3RhbnQKZXhwcmVzc2lvbnMgaW4gVk0gY29kZSIpIGFkZGVkIHRoZSBzaW1wbGVyIE1JTl9U
L01BWF9UIG1hY3JvcyBpbiBvcmRlcgp0byBhdm9pZCBzb21lIGV4Y2Vzc2l2ZSBleHBhbnNpb24g
ZnJvbSB0aGUgcmF0aGVyIGNvbXBsaWNhdGVkIHJlZ3VsYXIKbWluL21heCBtYWNyb3MuCgpUaGUg
Y29tcGxleGl0eSBvZiB0aG9zZSBtYWNyb3Mgc3RlbXMgZnJvbSB0d28gaXNzdWVzOgoKIChhKSB0
cnlpbmcgdG8gdXNlIHRoZW0gaW4gc2l0dWF0aW9ucyB0aGF0IHJlcXVpcmUgYSBDIGNvbnN0YW50
CiAgICAgZXhwcmVzc2lvbiAoaW4gc3RhdGljIGluaXRpYWxpemVycyBhbmQgZm9yIGFycmF5IHNp
emVzKQoKIChiKSB0aGUgdHlwZSBzYW5pdHkgY2hlY2tpbmcKCmFuZCBNSU5fVC9NQVhfVCBhdm9p
ZHMgYm90aCBvZiB0aGVzZSBpc3N1ZXMuCgpOb3csIGluIHRoZSB3aG9sZSAobG9uZykgZGlzY3Vz
c2lvbiBhYm91dCBhbGwgdGhpcywgaXQgd2FzIHBvaW50ZWQgb3V0CnRoYXQgdGhlIHdob2xlIHR5
cGUgc2FuaXR5IGNoZWNraW5nIGlzIGVudGlyZWx5IHVubmVjZXNzYXJ5IGZvcgptaW5fdC9tYXhf
dCB3aGljaCBnZXQgYSBmaXhlZCB0eXBlIHRoYXQgdGhlIGNvbXBhcmlzb24gaXMgZG9uZSBpbi4K
CkJ1dCB0aGF0IHN0aWxsIGxlYXZlcyBtaW5fdC9tYXhfdCB1bm5lY2Vzc2FyaWx5IGNvbXBsaWNh
dGVkIGR1ZSB0bwp3b3JyaWVzIGFib3V0IHRoZSBDIGNvbnN0YW50IGV4cHJlc3Npb24gY2FzZS4K
Ckhvd2V2ZXIsIGl0IHR1cm5zIG91dCB0aGF0IHRoZXJlIHJlYWxseSBhcmVuJ3QgdmVyeSBtYW55
IGNhc2VzIHRoYXQgdXNlCm1pbl90L21heF90IGZvciB0aGlzLCBhbmQgd2UgY2FuIGp1c3QgZm9y
Y2UtY29udmVydCB0aG9zZS4KClRoaXMgZG9lcyBleGFjdGx5IHRoYXQuCgpXaGljaCBpbiB0dXJu
IHdpbGwgdGhlbiBhbGxvdyBmb3IgbXVjaCBzaW1wbGVyIGltcGxlbWVudGF0aW9ucyBvZgptaW5f
dCgpL21heF90KCkuICBBbGwgdGhlIHVzdWFsICJtYWNyb3MgaW4gYWxsIHVwcGVyIGNhc2Ugd2ls
bCBldmFsdWF0ZQp0aGUgYXJndW1lbnRzIG11bHRpcGxlIHRpbWVzIiBydWxlcyBhcHBseS4KCldl
IHNob3VsZCBkbyBhbGwgdGhlIHNhbWUgdGhpbmdzIGZvciB0aGUgcmVndWxhciBtaW4vbWF4KCkg
dnMgTUlOL01BWCgpCmNhc2VzLCBidXQgdGhhdCBoYXMgdGhlIGFkZGVkIGNvbXBsZXhpdHkgb2Yg
dmFyaW91cyBkcml2ZXJzIGRlZmluaW5nCnRoZWlyIG93biBsb2NhbCB2ZXJzaW9ucyBvZiBNSU4v
TUFYLCBzbyB0aGF0IG5lZWRzIGFub3RoZXIgbGV2ZWwgb2YKZml4ZXMgZmlyc3QuCgpMaW5rOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvYjQ3ZmFkMWQwY2Y4NDQ5ODg2YWQxNDhmOGMwMTNk
YWVAQWN1TVMuYWN1bGFiLmNvbS8KQ2M6IERhdmlkIExhaWdodCA8RGF2aWQuTGFpZ2h0QGFjdWxh
Yi5jb20+CkNjOiBMb3JlbnpvIFN0b2FrZXMgPGxvcmVuem8uc3RvYWtlc0BvcmFjbGUuY29tPgpT
aWduZWQtb2ZmLWJ5OiBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91bmRhdGlvbi5v
cmc+ClNpZ25lZC1vZmYtYnk6IEVsaWF2IEZhcmJlciA8ZmFyYmVyZUBhbWF6b24uY29tPgotLS0K
VjIgLT4gVjM6CkZpeCBmcy9lcm9mcy96ZGF0YS5oIHRvIHVzZSBNSU5fVCBpbnN0ZWFkIG9mIG1p
bl90IHRvIGZpeCBidWlsZCBvbiB0aGUKZm9sbG93aW5nIHBhdGNoOgpJbiBmaWxlIGluY2x1ZGVk
IGZyb20gLi9pbmNsdWRlL2xpbnV4L2tlcm5lbC5oOjE2LAogICAgICAgICAgICAgICAgIGZyb20g
Li9pbmNsdWRlL2xpbnV4L2xpc3QuaDo5LAogICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRl
L2xpbnV4L3dhaXQuaDo3LAogICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L3dh
aXRfYml0Lmg6OCwKICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9mcy5oOjYs
CiAgICAgICAgICAgICAgICAgZnJvbSBmcy9lcm9mcy9pbnRlcm5hbC5oOjEwLAogICAgICAgICAg
ICAgICAgIGZyb20gZnMvZXJvZnMvemRhdGEuaDo5LAogICAgICAgICAgICAgICAgIGZyb20gZnMv
ZXJvZnMvemRhdGEuYzo2Ogpmcy9lcm9mcy96ZGF0YS5jOiBJbiBmdW5jdGlvbiDigJh6X2Vyb2Zz
X2RlY29tcHJlc3NfcGNsdXN0ZXLigJk6CmZzL2Vyb2ZzL3pkYXRhLmg6MTg1OjYxOiBlcnJvcjog
SVNPIEM5MCBmb3JiaWRzIHZhcmlhYmxlIGxlbmd0aCBhcnJheSDigJhwYWdlc19vbnN0YWNr4oCZ
IFstV2Vycm9yPXZsYV0KICAxODUgfCAgICAgICAgIG1pbl90KHVuc2lnbmVkIGludCwgVEhSRUFE
X1NJWkUgLyA4IC8gc2l6ZW9mKHN0cnVjdCBwYWdlICopLCA5NlUpCiAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fgou
L2luY2x1ZGUvbGludXgvbWlubWF4Lmg6NDk6MjM6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFj
cm8g4oCYX19jbXBfb25jZV91bmlxdWXigJkKICAgNDkgfCAgICAgICAgICh7IHR5cGUgdXggPSAo
eCk7IHR5cGUgdXkgPSAoeSk7IF9fY21wKG9wLCB1eCwgdXkpOyB9KQogICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICBeCi4vaW5jbHVkZS9saW51eC9taW5tYXguaDoxNjQ6Mjc6IG5vdGU6IGlu
IGV4cGFuc2lvbiBvZiBtYWNybyDigJhfX2NtcF9vbmNl4oCZCiAgMTY0IHwgI2RlZmluZSBtaW5f
dCh0eXBlLCB4LCB5KSBfX2NtcF9vbmNlKG1pbiwgdHlwZSwgeCwgeSkKICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn4KZnMvZXJvZnMvemRhdGEuaDoxODU6OTogbm90
ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmG1pbl904oCZCiAgMTg1IHwgICAgICAgICBtaW5f
dCh1bnNpZ25lZCBpbnQsIFRIUkVBRF9TSVpFIC8gOCAvIHNpemVvZihzdHJ1Y3QgcGFnZSAqKSwg
OTZVKQogICAgICB8ICAgICAgICAgXn5+fn4KZnMvZXJvZnMvemRhdGEuYzo4NDc6MzY6IG5vdGU6
IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhaX0VST0ZTX1ZNQVBfT05TVEFDS19QQUdFU+KAmQog
IDg0NyB8ICAgICAgICAgc3RydWN0IHBhZ2UgKnBhZ2VzX29uc3RhY2tbWl9FUk9GU19WTUFQX09O
U1RBQ0tfUEFHRVNdOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRl
ZCBhcyBlcnJvcnMKClYxIC0+IFYyOgpVc2UgYFsgVXBzdHJlYW0gY29tbWl0IDxIQVNIPiBdYCBp
bnN0ZWFkIG9mIGBjb21taXQgPEhBU0g+IHVwc3RyZWFtLmAKbGlrZSBpbiBhbGwgb3RoZXIgcGF0
Y2hlcy4KCiBhcmNoL3g4Ni9tbS9wZ3RhYmxlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgMiArLQogZHJpdmVycy9lZGFjL3NiX2VkYWMuYyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8IDQgKystLQogZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMgICAgICAgICAgICAg
ICAgICB8IDIgKy0KIGRyaXZlcnMvbWQvZG0taW50ZWdyaXR5LmMgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAyICstCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNf
bWFpbi5jIHwgMiArLQogZnMvZXJvZnMvemRhdGEuaCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDIgKy0KIG5ldC9pcHY0L3Byb2MuYyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAyICstCiBuZXQvaXB2Ni9wcm9jLmMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgMiArLQogOCBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvbW0vcGd0YWJsZS5jIGIvYXJjaC94ODYv
bW0vcGd0YWJsZS5jCmluZGV4IDM0ODFiMzVjYjRlYy4uZTY0OTE2MWViNmZjIDEwMDY0NAotLS0g
YS9hcmNoL3g4Ni9tbS9wZ3RhYmxlLmMKKysrIGIvYXJjaC94ODYvbW0vcGd0YWJsZS5jCkBAIC0x
MDcsNyArMTA3LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHBnZF9saXN0X2RlbChwZ2RfdCAqcGdk
KQogI2RlZmluZSBVTlNIQVJFRF9QVFJTX1BFUl9QR0QJCQkJXAogCShTSEFSRURfS0VSTkVMX1BN
RCA/IEtFUk5FTF9QR0RfQk9VTkRBUlkgOiBQVFJTX1BFUl9QR0QpCiAjZGVmaW5lIE1BWF9VTlNI
QVJFRF9QVFJTX1BFUl9QR0QJCQlcCi0JbWF4X3Qoc2l6ZV90LCBLRVJORUxfUEdEX0JPVU5EQVJZ
LCBQVFJTX1BFUl9QR0QpCisJTUFYX1Qoc2l6ZV90LCBLRVJORUxfUEdEX0JPVU5EQVJZLCBQVFJT
X1BFUl9QR0QpCiAKIAogc3RhdGljIHZvaWQgcGdkX3NldF9tbShwZ2RfdCAqcGdkLCBzdHJ1Y3Qg
bW1fc3RydWN0ICptbSkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZWRhYy9zYl9lZGFjLmMgYi9kcml2
ZXJzL2VkYWMvc2JfZWRhYy5jCmluZGV4IDE1MjJkNGFhMmNhNi4uNzE0MDIwZTc0MDVhIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2VkYWMvc2JfZWRhYy5jCisrKyBiL2RyaXZlcnMvZWRhYy9zYl9lZGFj
LmMKQEAgLTEwOSw4ICsxMDksOCBAQCBzdGF0aWMgY29uc3QgdTMyIGtubF9pbnRlcmxlYXZlX2xp
c3RbXSA9IHsKIAkweDEwNCwgMHgxMGMsIDB4MTE0LCAweDExYywgICAvKiAyMC0yMyAqLwogfTsK
ICNkZWZpbmUgTUFYX0lOVEVSTEVBVkUJCQkJCQkJXAotCShtYXhfdCh1bnNpZ25lZCBpbnQsIEFS
UkFZX1NJWkUoc2JyaWRnZV9pbnRlcmxlYXZlX2xpc3QpLAlcCi0JICAgICAgIG1heF90KHVuc2ln
bmVkIGludCwgQVJSQVlfU0laRShpYnJpZGdlX2ludGVybGVhdmVfbGlzdCksCVwKKwkoTUFYX1Qo
dW5zaWduZWQgaW50LCBBUlJBWV9TSVpFKHNicmlkZ2VfaW50ZXJsZWF2ZV9saXN0KSwJXAorCSAg
ICAgICBNQVhfVCh1bnNpZ25lZCBpbnQsIEFSUkFZX1NJWkUoaWJyaWRnZV9pbnRlcmxlYXZlX2xp
c3QpLAlcCiAJCSAgICAgQVJSQVlfU0laRShrbmxfaW50ZXJsZWF2ZV9saXN0KSkpKQogCiBzdHJ1
Y3QgaW50ZXJsZWF2ZV9wa2cgewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb2xv
cl9tZ210LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9yX21nbXQuYwppbmRleCBiYjE0ZjQ4
OGM4ZjYuLjFmZjU3MmQ4NzQ0ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb2xv
cl9tZ210LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMKQEAgLTUyOCw3
ICs1MjgsNyBAQCBpbnQgZHJtX3BsYW5lX2NyZWF0ZV9jb2xvcl9wcm9wZXJ0aWVzKHN0cnVjdCBk
cm1fcGxhbmUgKnBsYW5lLAogewogCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBwbGFuZS0+ZGV2
OwogCXN0cnVjdCBkcm1fcHJvcGVydHkgKnByb3A7Ci0Jc3RydWN0IGRybV9wcm9wX2VudW1fbGlz
dCBlbnVtX2xpc3RbbWF4X3QoaW50LCBEUk1fQ09MT1JfRU5DT0RJTkdfTUFYLAorCXN0cnVjdCBk
cm1fcHJvcF9lbnVtX2xpc3QgZW51bV9saXN0W01BWF9UKGludCwgRFJNX0NPTE9SX0VOQ09ESU5H
X01BWCwKIAkJCQkJCSAgICAgICBEUk1fQ09MT1JfUkFOR0VfTUFYKV07CiAJaW50IGksIGxlbjsK
IApkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9kbS1pbnRlZ3JpdHkuYyBiL2RyaXZlcnMvbWQvZG0t
aW50ZWdyaXR5LmMKaW5kZXggZTlkNTUzZWVhOWNkLi44ZTJiMDA1MzZjM2UgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvbWQvZG0taW50ZWdyaXR5LmMKKysrIGIvZHJpdmVycy9tZC9kbS1pbnRlZ3JpdHku
YwpAQCAtMjUzNiw3ICsyNTM2LDcgQEAgc3RhdGljIHZvaWQgZG9fam91cm5hbF93cml0ZShzdHJ1
Y3QgZG1faW50ZWdyaXR5X2MgKmljLCB1bnNpZ25lZCB3cml0ZV9zdGFydCwKIAkJCQkgICAgdW5s
aWtlbHkoZnJvbV9yZXBsYXkpICYmCiAjZW5kaWYKIAkJCQkgICAgaWMtPmludGVybmFsX2hhc2gp
IHsKLQkJCQkJY2hhciB0ZXN0X3RhZ1ttYXhfdChzaXplX3QsIEhBU0hfTUFYX0RJR0VTVFNJWkUs
IE1BWF9UQUdfU0laRSldOworCQkJCQljaGFyIHRlc3RfdGFnW01BWF9UKHNpemVfdCwgSEFTSF9N
QVhfRElHRVNUU0laRSwgTUFYX1RBR19TSVpFKV07CiAKIAkJCQkJaW50ZWdyaXR5X3NlY3Rvcl9j
aGVja3N1bShpYywgc2VjICsgKChsIC0gaikgPDwgaWMtPnNiLT5sb2cyX3NlY3RvcnNfcGVyX2Js
b2NrKSwKIAkJCQkJCQkJICAoY2hhciAqKWFjY2Vzc19qb3VybmFsX2RhdGEoaWMsIGksIGwpLCB0
ZXN0X3RhZyk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9zdG1tYWNfbWFpbi5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3Rt
bWFjX21haW4uYwppbmRleCAyNDc4Y2FlZWM3NjMuLjIxY2M4Y2Q5ZTAyMyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYworKysgYi9k
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCkBAIC0yODA1
LDcgKzI4MDUsNyBAQCBzdGF0aWMgdm9pZCBzdG1tYWNfZG1hX2ludGVycnVwdChzdHJ1Y3Qgc3Rt
bWFjX3ByaXYgKnByaXYpCiAJdTMyIGNoYW5uZWxzX3RvX2NoZWNrID0gdHhfY2hhbm5lbF9jb3Vu
dCA+IHJ4X2NoYW5uZWxfY291bnQgPwogCQkJCXR4X2NoYW5uZWxfY291bnQgOiByeF9jaGFubmVs
X2NvdW50OwogCXUzMiBjaGFuOwotCWludCBzdGF0dXNbbWF4X3QodTMyLCBNVExfTUFYX1RYX1FV
RVVFUywgTVRMX01BWF9SWF9RVUVVRVMpXTsKKwlpbnQgc3RhdHVzW01BWF9UKHUzMiwgTVRMX01B
WF9UWF9RVUVVRVMsIE1UTF9NQVhfUlhfUVVFVUVTKV07CiAKIAkvKiBNYWtlIHN1cmUgd2UgbmV2
ZXIgY2hlY2sgYmV5b25kIG91ciBzdGF0dXMgYnVmZmVyLiAqLwogCWlmIChXQVJOX09OX09OQ0Uo
Y2hhbm5lbHNfdG9fY2hlY2sgPiBBUlJBWV9TSVpFKHN0YXR1cykpKQpkaWZmIC0tZ2l0IGEvZnMv
ZXJvZnMvemRhdGEuaCBiL2ZzL2Vyb2ZzL3pkYXRhLmgKaW5kZXggM2EwMDhmMWI5Zjc4Li40Mzg3
NmZkOGEyY2IgMTAwNjQ0Ci0tLSBhL2ZzL2Vyb2ZzL3pkYXRhLmgKKysrIGIvZnMvZXJvZnMvemRh
dGEuaApAQCAtMTgyLDcgKzE4Miw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB6X2Vyb2ZzX29ubGlu
ZXBhZ2VfZW5kaW8oc3RydWN0IHBhZ2UgKnBhZ2UpCiB9CiAKICNkZWZpbmUgWl9FUk9GU19WTUFQ
X09OU1RBQ0tfUEFHRVMJXAotCW1pbl90KHVuc2lnbmVkIGludCwgVEhSRUFEX1NJWkUgLyA4IC8g
c2l6ZW9mKHN0cnVjdCBwYWdlICopLCA5NlUpCisJTUlOX1QodW5zaWduZWQgaW50LCBUSFJFQURf
U0laRSAvIDggLyBzaXplb2Yoc3RydWN0IHBhZ2UgKiksIDk2VSkKICNkZWZpbmUgWl9FUk9GU19W
TUFQX0dMT0JBTF9QQUdFUwkyMDQ4CiAKICNlbmRpZgpkaWZmIC0tZ2l0IGEvbmV0L2lwdjQvcHJv
Yy5jIGIvbmV0L2lwdjQvcHJvYy5jCmluZGV4IDRiOTI4MGEzYjY3My4uZDg0OWY2MWI3NTE5IDEw
MDY0NAotLS0gYS9uZXQvaXB2NC9wcm9jLmMKKysrIGIvbmV0L2lwdjQvcHJvYy5jCkBAIC00Myw3
ICs0Myw3IEBACiAjaW5jbHVkZSA8bmV0L3NvY2suaD4KICNpbmNsdWRlIDxuZXQvcmF3Lmg+CiAK
LSNkZWZpbmUgVENQVURQX01JQl9NQVggbWF4X3QodTMyLCBVRFBfTUlCX01BWCwgVENQX01JQl9N
QVgpCisjZGVmaW5lIFRDUFVEUF9NSUJfTUFYIE1BWF9UKHUzMiwgVURQX01JQl9NQVgsIFRDUF9N
SUJfTUFYKQogCiAvKgogICoJUmVwb3J0IHNvY2tldCBhbGxvY2F0aW9uIHN0YXRpc3RpY3MgW21l
YUB1dHUuZmldCmRpZmYgLS1naXQgYS9uZXQvaXB2Ni9wcm9jLmMgYi9uZXQvaXB2Ni9wcm9jLmMK
aW5kZXggZDYzMDZhYTQ2YmIxLi5lMDdjNDNiZDVjYjAgMTAwNjQ0Ci0tLSBhL25ldC9pcHY2L3By
b2MuYworKysgYi9uZXQvaXB2Ni9wcm9jLmMKQEAgLTI3LDcgKzI3LDcgQEAKICNpbmNsdWRlIDxu
ZXQvaXB2Ni5oPgogCiAjZGVmaW5lIE1BWDQoYSwgYiwgYywgZCkgXAotCW1heF90KHUzMiwgbWF4
X3QodTMyLCBhLCBiKSwgbWF4X3QodTMyLCBjLCBkKSkKKwlNQVhfVCh1MzIsIE1BWF9UKHUzMiwg
YSwgYiksIE1BWF9UKHUzMiwgYywgZCkpCiAjZGVmaW5lIFNOTVBfTUlCX01BWCBNQVg0KFVEUF9N
SUJfTUFYLCBUQ1BfTUlCX01BWCwgXAogCQkJSVBTVEFUU19NSUJfTUFYLCBJQ01QX01JQl9NQVgp
CiAKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
