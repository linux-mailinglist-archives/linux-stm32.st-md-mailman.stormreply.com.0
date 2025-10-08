Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4563CBC592C
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Oct 2025 17:30:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83466C55593;
	Wed,  8 Oct 2025 15:30:11 +0000 (UTC)
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com
 (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com
 [35.83.148.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7686FC55592
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Oct 2025 15:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
 t=1759937409; x=1791473409;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6cTKEV+ZWAzAeKhYDhuZKam17XzSPB7XFB7f4qhxTuM=;
 b=EkdX5s2tLbOjIdVoBR/fdVIPdFmvTQ3HokleyTqmIIYAbQFb7xCp0EBS
 ToyPi1EjghnPvrsB0QYA7H1RD3x1nlutb+vK8PiEVpTaLZtHJiquwa3D7
 uASWKsPHvPteR9CD0Kq+pqP7GdThtycTgk+Yx93hqAxKKB1hyukWCF1L4
 dqQjwr66JDWab9yTMFxGRx+dVYO6f+4Gk7rix5/u0Oe2/TaScMZOjqs3s
 FBcL2iaJ26yWluRRSB2ITJJbHPtBU9k/Zqowjrj4/EqhxJyXXk0O/yqgs
 kXb4X1ttPos/wzZiRgUS69mvbAl0C9DmbAdfeh3NsngYP/BoXp1s2UtS5 g==;
X-CSE-ConnectionGUID: +r/ORJCDT3mdkeM9bLhVCA==
X-CSE-MsgGUID: 5xwXbkFvQYqm5UYp+BBs7A==
X-IronPort-AV: E=Sophos;i="6.19,213,1754956800"; 
   d="scan'208";a="4330400"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO
 smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
 by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 15:30:06 +0000
Received: from EX19MTAUWC002.ant.amazon.com [10.0.38.20:22420]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.27.3:2525] with
 esmtp (Farcaster)
 id 93ca9f84-9d14-4911-90f5-a97300a639c2; Wed, 8 Oct 2025 15:30:06 +0000 (UTC)
X-Farcaster-Flow-ID: 93ca9f84-9d14-4911-90f5-a97300a639c2
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Wed, 8 Oct 2025 15:30:05 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Wed, 8 Oct 2025
 15:29:52 +0000
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
Date: Wed, 8 Oct 2025 15:29:25 +0000
Message-ID: <20251008152946.29285-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D032UWA001.ant.amazon.com (10.13.139.62) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Subject: [Linux-stm32] [PATCH v3 00/19 5.15.y] Backport minmax.h updates
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

VGhpcyBzZXJpZXMgYmFja3BvcnRzIDE5IHBhdGNoZXMgdG8gdXBkYXRlIG1pbm1heC5oIGluIHRo
ZSA1LjE1LnkgYnJhbmNoLAphbGlnbmluZyBpdCB3aXRoIHY2LjE3LXJjNy4KClRoZSB1bHRpbWF0
ZSBnb2FsIGlzIHRvIHN5bmNocm9uaXplIGFsbCBsb25ndGVybSBicmFuY2hlcyBzbyB0aGF0IHRo
ZXkKaW5jbHVkZSB0aGUgZnVsbCBzZXQgb2YgbWlubWF4LmggY2hhbmdlcy4KCjYuMTIueSB3YXMg
YWxyZWFkeSBiYWNrcG9ydGVkIGFuZCBjaGFuZ2VzIGFyZSBwYXJ0IG9mIHY2LjEyLjQ5Lgo2LjYu
eSB3YXMgYWxyZWFkeSBiYWNrcG9ydGVkIGFuZCBjaGFuZ2VzIGFyZSBwYXJ0IG9mIHY2LjYuMTA5
Lgo2LjEueSB3YXMgYWxyZWFkeSBiYWNrcG9ydGVkIGFuZCBjaGFuZ2VzIGFyZSBjdXJyZW50bHkg
aW4gdGhlIDYuMS1zdGFibGUKdHJlZS4KClRoZSBrZXkgbW90aXZhdGlvbiBpcyB0byBicmluZyBp
biBjb21taXQgZDAzZWJhOTlmNWJmICgibWlubWF4OiBhbGxvdwptaW4oKS9tYXgoKS9jbGFtcCgp
IGlmIHRoZSBhcmd1bWVudHMgaGF2ZSB0aGUgc2FtZSBzaWduZWRuZXNzIiksIHdoaWNoCmlzIG1p
c3NpbmcgaW4ga2VybmVsIDUuMTAueS4KCkluIG1haW5saW5lLCB0aGlzIGNoYW5nZSBlbmFibGVz
IG1pbigpL21heCgpL2NsYW1wKCkgdG8gYWNjZXB0IG1peGVkCmFyZ3VtZW50IHR5cGVzLCBwcm92
aWRlZCBib3RoIGhhdmUgdGhlIHNhbWUgc2lnbmVkbmVzcy4gV2l0aG91dCBpdCwKYmFja3BvcnRl
ZCBwYXRjaGVzIHRoYXQgdXNlIHRoZXNlIGZvcm1zIG1heSB0cmlnZ2VyIGNvbXBpbGVyIHdhcm5p
bmdzLAp3aGljaCBlc2NhbGF0ZSB0byBidWlsZCBmYWlsdXJlcyB3aGVuIC1XZXJyb3IgaXMgZW5h
YmxlZC4KCkNoYW5nZXMgaW4gdjM6Ci0gRml4IGZzL2Vyb2ZzL3pkYXRhLmggaW4gcGF0Y2ggMDYv
MTkgdG8gdXNlIE1JTl9UIGluc3RlYWQgb2YgbWluX3QgdG8KICBmaXggYnVpbGQgb24gdGhlIGZv
bGxvd2luZyBwYXRjaCAoMDcvMTkpOgpJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi9pbmNsdWRlL2xp
bnV4L2tlcm5lbC5oOjE2LAogICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L2xp
c3QuaDo5LAogICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L3dhaXQuaDo3LAog
ICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L3dhaXRfYml0Lmg6OCwKICAgICAg
ICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9mcy5oOjYsCiAgICAgICAgICAgICAgICAg
ZnJvbSBmcy9lcm9mcy9pbnRlcm5hbC5oOjEwLAogICAgICAgICAgICAgICAgIGZyb20gZnMvZXJv
ZnMvemRhdGEuaDo5LAogICAgICAgICAgICAgICAgIGZyb20gZnMvZXJvZnMvemRhdGEuYzo2Ogpm
cy9lcm9mcy96ZGF0YS5jOiBJbiBmdW5jdGlvbiDigJh6X2Vyb2ZzX2RlY29tcHJlc3NfcGNsdXN0
ZXLigJk6CmZzL2Vyb2ZzL3pkYXRhLmg6MTg1OjYxOiBlcnJvcjogSVNPIEM5MCBmb3JiaWRzIHZh
cmlhYmxlIGxlbmd0aCBhcnJheSDigJhwYWdlc19vbnN0YWNr4oCZIFstV2Vycm9yPXZsYV0KICAx
ODUgfCAgICAgICAgIG1pbl90KHVuc2lnbmVkIGludCwgVEhSRUFEX1NJWkUgLyA4IC8gc2l6ZW9m
KHN0cnVjdCBwYWdlICopLCA5NlUpCiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fgouL2luY2x1ZGUvbGludXgvbWlu
bWF4Lmg6NDk6MjM6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8g4oCYX19jbXBfb25jZV91
bmlxdWXigJkKICAgNDkgfCAgICAgICAgICh7IHR5cGUgdXggPSAoeCk7IHR5cGUgdXkgPSAoeSk7
IF9fY21wKG9wLCB1eCwgdXkpOyB9KQogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICBeCi4v
aW5jbHVkZS9saW51eC9taW5tYXguaDoxNjQ6Mjc6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNy
byDigJhfX2NtcF9vbmNl4oCZCiAgMTY0IHwgI2RlZmluZSBtaW5fdCh0eXBlLCB4LCB5KSBfX2Nt
cF9vbmNlKG1pbiwgdHlwZSwgeCwgeSkKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAg
IF5+fn5+fn5+fn4KZnMvZXJvZnMvemRhdGEuaDoxODU6OTogbm90ZTogaW4gZXhwYW5zaW9uIG9m
IG1hY3JvIOKAmG1pbl904oCZCiAgMTg1IHwgICAgICAgICBtaW5fdCh1bnNpZ25lZCBpbnQsIFRI
UkVBRF9TSVpFIC8gOCAvIHNpemVvZihzdHJ1Y3QgcGFnZSAqKSwgOTZVKQogICAgICB8ICAgICAg
ICAgXn5+fn4KZnMvZXJvZnMvemRhdGEuYzo4NDc6MzY6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBt
YWNybyDigJhaX0VST0ZTX1ZNQVBfT05TVEFDS19QQUdFU+KAmQogIDg0NyB8ICAgICAgICAgc3Ry
dWN0IHBhZ2UgKnBhZ2VzX29uc3RhY2tbWl9FUk9GU19WTUFQX09OU1RBQ0tfUEFHRVNdOwogICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn4KY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKCi0gSW5j
cmVhc2UgdGVzdCBjb3ZlcmFnZSB1c2luZyBgbWFrZSBhbGx5ZXNjb25maWdgIGFuZAogIGBtYWtl
IGFsbG1vZGNvbmZpZ2AgZm9yIGFybTY0LCBhcm0sIHg4Nl82NCBhbmQgaTM4NiBhcmNoaXRlY3R1
cmVzLgoKQ2hhbmdlcyBpbiB2MjoKLSBGaXggdGhlIG9yZGVyIG9mIHBhdGNoZXMgNiAtIDEwIGFj
Y29yZGluZyB0byBvcmRlciBpbiBtYWlubGluZSBicmFuY2guCi0gVXNlIHNhbWUgc3R5bGUgb2Yg
WyBVcHN0cmVhbSBjb21taXQgPEhBU0g+IF0gaW4gYWxsIHBhdGNoZXMuCgpBbmR5IFNoZXZjaGVu
a28gKDEpOgogIG1pbm1heDogZGVkdXBsaWNhdGUgX191bmNvbnN0X2ludGVnZXJfdHlwZW9mKCkK
CkRhdmlkIExhaWdodCAoOCk6CiAgbWlubWF4OiBmaXggaW5kZW50YXRpb24gb2YgX19jbXBfb25j
ZSgpIGFuZCBfX2NsYW1wX29uY2UoKQogIG1pbm1heC5oOiBhZGQgd2hpdGVzcGFjZSBhcm91bmQg
b3BlcmF0b3JzIGFuZCBhZnRlciBjb21tYXMKICBtaW5tYXguaDogdXBkYXRlIHNvbWUgY29tbWVu
dHMKICBtaW5tYXguaDogcmVkdWNlIHRoZSAjZGVmaW5lIGV4cGFuc2lvbiBvZiBtaW4oKSwgbWF4
KCkgYW5kIGNsYW1wKCkKICBtaW5tYXguaDogdXNlIEJVSUxEX0JVR19PTl9NU0coKSBmb3IgdGhl
IGxvIDwgaGkgdGVzdCBpbiBjbGFtcCgpCiAgbWlubWF4Lmg6IG1vdmUgYWxsIHRoZSBjbGFtcCgp
IGRlZmluaXRpb25zIGFmdGVyIHRoZSBtaW4vbWF4KCkgb25lcwogIG1pbm1heC5oOiBzaW1wbGlm
eSB0aGUgdmFyaWFudHMgb2YgY2xhbXAoKQogIG1pbm1heC5oOiByZW1vdmUgc29tZSAjZGVmaW5l
cyB0aGF0IGFyZSBvbmx5IGV4cGFuZGVkIG9uY2UKCkhlcnZlIENvZGluYSAoMSk6CiAgbWlubWF4
OiBJbnRyb2R1Y2Uge21pbixtYXh9X2FycmF5KCkKCkxpbnVzIFRvcnZhbGRzICg4KToKICBtaW5t
YXg6IGF2b2lkIG92ZXJseSBjb21wbGljYXRlZCBjb25zdGFudCBleHByZXNzaW9ucyBpbiBWTSBj
b2RlCiAgbWlubWF4OiBhZGQgYSBmZXcgbW9yZSBNSU5fVC9NQVhfVCB1c2VycwogIG1pbm1heDog
c2ltcGxpZnkgYW5kIGNsYXJpZnkgbWluX3QoKS9tYXhfdCgpIGltcGxlbWVudGF0aW9uCiAgbWlu
bWF4OiBtYWtlIGdlbmVyaWMgTUlOKCkgYW5kIE1BWCgpIG1hY3JvcyBhdmFpbGFibGUgZXZlcnl3
aGVyZQogIG1pbm1heDogZG9uJ3QgdXNlIG1heCgpIGluIHNpdHVhdGlvbnMgdGhhdCB3YW50IGEg
QyBjb25zdGFudAogICAgZXhwcmVzc2lvbgogIG1pbm1heDogc2ltcGxpZnkgbWluKCkvbWF4KCkv
Y2xhbXAoKSBpbXBsZW1lbnRhdGlvbgogIG1pbm1heDogaW1wcm92ZSBtYWNybyBleHBhbnNpb24g
YW5kIHR5cGUgY2hlY2tpbmcKICBtaW5tYXg6IGZpeCB1cCBtaW4zKCkgYW5kIG1heDMoKSB0b28K
Ck1hdHRoZXcgV2lsY294IChPcmFjbGUpICgxKToKICBtaW5tYXg6IGFkZCBpbl9yYW5nZSgpIG1h
Y3JvCgogYXJjaC9hcm0vbW0vcGFnZWF0dHIuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgICA2
ICstCiBhcmNoL3VtL2RyaXZlcnMvbWNvbnNvbGVfdXNlci5jICAgICAgICAgICAgICAgfCAgIDIg
KwogYXJjaC94ODYvbW0vcGd0YWJsZS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICst
CiBkcml2ZXJzL2VkYWMvc2JfZWRhYy5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0K
IGRyaXZlcnMvZWRhYy9za3hfY29tbW9uLmggICAgICAgICAgICAgICAgICAgICB8ICAgMSAtCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCAgICAgICAgICAgfCAgIDIgKwogLi4u
L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcF9kZGMuYyAgIHwgICAyICsKIC4uLi9k
cm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9wcGV2dm1hdGguaCAgICB8ICAxNCArLQogLi4uL2Ft
ZC9wbS9zd3NtdS9zbXUxMS9zaWVubmFfY2ljaGxpZF9wcHQuYyAgIHwgICAyICsKIC4uLi9kcm0v
YXJtL2Rpc3BsYXkvaW5jbHVkZS9tYWxpZHBfdXRpbHMuaCAgICB8ICAgMiArLQogLi4uL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jICAgIHwgIDI0ICstCiBkcml2ZXJzL2dw
dS9kcm0vZHJtX2NvbG9yX21nbXQuYyAgICAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1
L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmMgICAgICAgICB8ICAgNiAtCiBkcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL2V2ZXJncmVlbl9jcy5jICAgICAgICAgfCAgIDIgKwogZHJpdmVycy9od21vbi9h
ZHQ3NDc1LmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDI0ICstCiBkcml2ZXJzL2lucHV0L3Rv
dWNoc2NyZWVuL2N5dHRzcDRfY29yZS5jICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvaXJxY2hpcC9p
cnEtc3VuNmktci5jICAgICAgICAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9tZC9kbS1pbnRl
Z3JpdHkuYyAgICAgICAgICAgICAgICAgICAgIHwgICA0ICstCiBkcml2ZXJzL21lZGlhL2R2Yi1m
cm9udGVuZHMvc3R2MDM2N19wcml2LmggICAgfCAgIDMgKwogLi4uL25ldC9ldGhlcm5ldC9jaGVs
c2lvL2N4Z2IzL2N4Z2IzX21haW4uYyAgIHwgIDE4ICstCiAuLi4vbmV0L2V0aGVybmV0L3N0bWlj
cm8vc3RtbWFjL3N0bW1hY19tYWluLmMgfCAgIDIgKy0KIGRyaXZlcnMvbmV0L2ZqZXMvZmplc19t
YWluLmMgICAgICAgICAgICAgICAgICB8ICAgNCArLQogZHJpdmVycy9uZmMvcG41NDQvaTJjLmMg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAyIC0KIGRyaXZlcnMvcGxhdGZvcm0veDg2L3Nvbnkt
bGFwdG9wLmMgICAgICAgICAgICB8ICAgMSAtCiBkcml2ZXJzL3Njc2kvaXNjaS9pbml0LmMgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDYgKy0KIC4uLi9wY2kvaGl2ZV9pc3BfY3NzX2luY2x1ZGUv
bWF0aF9zdXBwb3J0LmggICB8ICAgNSAtCiBkcml2ZXJzL3ZpcnQvYWNybi9pb3JlcS5jICAgICAg
ICAgICAgICAgICAgICAgfCAgIDQgKy0KIGZzL2J0cmZzL21pc2MuaCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgMiAtCiBmcy9idHJmcy90cmVlLWNoZWNrZXIuYyAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDIgKy0KIGZzL2Vyb2ZzL3pkYXRhLmggICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgMiArLQogZnMvZXh0Mi9iYWxsb2MuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAyIC0KIGZzL2V4dDQvZXh0NC5oICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMiAtCiBmcy91ZnMvdXRpbC5oICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDYgLQogaW5jbHVkZS9saW51eC9jb21waWxlci5oICAgICAgICAgICAgICAgICAg
ICAgIHwgICA5ICsKIGluY2x1ZGUvbGludXgvbWlubWF4LmggICAgICAgICAgICAgICAgICAgICAg
ICB8IDI2NCArKysrKysrKysrKysrLS0tLS0KIGtlcm5lbC90cmFjZS9wcmVlbXB0aXJxX2RlbGF5
X3Rlc3QuYyAgICAgICAgICB8ICAgMiAtCiBsaWIvYnRyZWUuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDEgLQogbGliL2RlY29tcHJlc3NfdW5sem1hLmMgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAyICsKIGxpYi9sb2dpY19waW8uYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgMyAtCiBsaWIvdnNwcmludGYuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDIgKy0KIGxpYi96c3RkL3pzdGRfaW50ZXJuYWwuaCAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMiAtCiBtbS96c21hbGxvYy5jICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDEgLQogbmV0L2lwdjQvcHJvYy5jICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICAyICstCiBuZXQvaXB2Ni9wcm9jLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDIgKy0KIG5ldC9uZXRmaWx0ZXIvbmZfbmF0X2NvcmUuYyAgICAgICAgICAgICAgICAg
ICB8ICAgNiArLQogbmV0L3RpcGMvY29yZS5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICAyICstCiBuZXQvdGlwYy9saW5rLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMTAgKy0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3ZtL21yZW1hcF90ZXN0LmMgICAgICB8
ICAgMiArCiA0OCBmaWxlcyBjaGFuZ2VkLCAyOTAgaW5zZXJ0aW9ucygrKSwgMTg0IGRlbGV0aW9u
cygtKQoKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
