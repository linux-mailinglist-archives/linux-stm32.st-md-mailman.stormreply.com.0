Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B62C416DD
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 20:23:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A05DC1A97F;
	Fri,  7 Nov 2025 19:23:17 +0000 (UTC)
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 266A9C35E2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 19:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id EDA862CFC9B;
 Fri,  7 Nov 2025 20:23:14 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 2R6fOeHHtymO; Fri,  7 Nov 2025 20:23:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 813442CFC87;
 Fri,  7 Nov 2025 20:23:14 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zqOd4E8HCNTp; Fri,  7 Nov 2025 20:23:14 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4A11611C056;
 Fri,  7 Nov 2025 20:23:14 +0100 (CET)
Date: Fri, 7 Nov 2025 20:23:14 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Markus Elfring <Markus.Elfring@web.de>
Message-ID: <79797154.158914.1762543394141.JavaMail.zimbra@nod.at>
In-Reply-To: <14f5091f-b647-40c9-9c32-6a705c2d6c37@web.de>
References: <20251107100057.1091153-1-pangliyuan1@huawei.com>
 <7857ab09-7808-4abe-9df1-66235291436b@web.de>
 <DF8B15D4-4819-47E6-9BB0-268AD0204C86@nod.at>
 <14f5091f-b647-40c9-9c32-6a705c2d6c37@web.de>
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF143
 (Linux)/8.8.12_GA_3809)
Thread-Topic: fastmap: fix ubi->fm memory leak
Thread-Index: fBqM9AqfBycgbGob73i+cfkQqy6K6g==
Cc: Yang Liu <young.liuyang@huawei.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Liyuan Pang <pangliyuan1@huawei.com>, chengzhihao1 <chengzhihao1@huawei.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 mcoquelin stm32 <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, wanqian10@huawei.com,
 linux-stm32 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [v2] ubi: fastmap: fix ubi->fm memory leak
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1hcmt1cyBFbGZyaW5nIiA8
TWFya3VzLkVsZnJpbmdAd2ViLmRlPgo+PiA+IFlvdSBtYXkgb2NjYXNpb25hbGx5IHB1dCBtb3Jl
IHRoYW4gNjAgY2hhcmFjdGVycyBpbnRvIHRleHQgbGluZXMKPj4gPiBvZiBzdWNoIGEgY2hhbmdl
IGRlc2NyaXB0aW9uLgo+PiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9z
dWJtaXR0aW5nLXBhdGNoZXMucnN0P2g9djYuMTgtcmM0I242NTgKPiAKPj4gRmVlbCBmcmVlIHRv
IGlnbm9yZSBldmVyeXRoaW5nIE1hcmt1cyBzYXlzLgo+IAo+IERvZXMgeW91ciBmZWVkYmFjayBp
bmRpY2F0ZSB0aGVuIGFsc28gdGhhdCBMaW51eCBkZXZlbG9wbWVudCBwcm9jZXNzCj4gZG9jdW1l
bnRhdGlvbiBtYXkgYmUgb3Zlcmxvb2tlZCBhbnkgbW9yZT8KClRoZSBvbmx5IHJlYXNvbiB3aHkg
eW91IGFyZSBub3Qgb24gbXkga2lsbCBmaWxlIGlzIHRoYXQgSSBjYW4gcHJvdGVjdCBuZXdiaWVz
IGZyb20geW91LgoKVG8gcXVvdGUgR3JlZ0tIWzBdOgo+IE1hcmt1cywgeW91IHNlZW0gdG8gaGF2
ZSBzZW50IGEgbm9uc2Vuc2ljYWwgb3Igb3RoZXJ3aXNlIHBvaW50bGVzcwo+IHJldmlldyBjb21t
ZW50IHRvIGEgcGF0Y2ggc3VibWlzc2lvbiBvbiBhIExpbnV4IGtlcm5lbCBkZXZlbG9wZXIgbWFp
bGluZwo+IGxpc3QuICBJIHN0cm9uZ2x5IHN1Z2dlc3QgdGhhdCB5b3Ugbm90IGRvIHRoaXMgYW55
bW9yZS4gIFBsZWFzZSBkbyBub3QKPiBib3RoZXIgZGV2ZWxvcGVycyB3aG8gYXJlIGFjdGl2ZWx5
IHdvcmtpbmcgdG8gcHJvZHVjZSBwYXRjaGVzIGFuZAo+IGZlYXR1cmVzIHdpdGggY29tbWVudHMg
dGhhdCwgaW4gdGhlIGVuZCwgYXJlIGEgd2FzdGUgb2YgdGltZS4KCj4gUGF0Y2ggc3VibWl0dGVy
LCBwbGVhc2UgaWdub3JlIE1hcmt1cydzIHN1Z2dlc3Rpb247IHlvdSBkbyBub3QgbmVlZCB0bwo+
IGZvbGxvdyBpdCBhdCBhbGwuICBUaGUgcGVyc29uL2JvdC9BSSB0aGF0IHNlbnQgaXQgaXMgYmVp
bmcgaWdub3JlZCBieQo+IGFsbW9zdCBhbGwgTGludXgga2VybmVsIG1haW50YWluZXJzIGZvciBo
YXZpbmcgYSBwZXJzaXN0ZW50IHBhdHRlcm4gb2YKPiBiZWhhdmlvciBvZiBwcm9kdWNpbmcgZGlz
dHJhY3RpbmcgYW5kIHBvaW50bGVzcyBjb21tZW50YXJ5LCBhbmQKPiBpbmFiaWxpdHkgdG8gYWRh
cHQgdG8gZmVlZGJhY2suICBQbGVhc2UgZmVlbCBmcmVlIHRvIGFsc28gaWdub3JlIGVtYWlscwo+
IGZyb20gdGhlbS4KClRoYW5rcywKLy9yaWNoYXJkCgpbMF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGttbC8yMDI1MTEwNTE2LWN1YmljYWwtZHJvd3NpbHktN2FjZEBncmVna2gvCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
