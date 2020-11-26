Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D2F2C4C72
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Nov 2020 02:15:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6591EC424AF;
	Thu, 26 Nov 2020 01:15:06 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86711C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Nov 2020 01:15:04 +0000 (UTC)
Received: from dggeme760-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ChKYD6vgTz4yNM;
 Thu, 26 Nov 2020 09:14:40 +0800 (CST)
Received: from [127.0.0.1] (10.57.36.170) by dggeme760-chm.china.huawei.com
 (10.3.19.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1913.5; Thu, 26
 Nov 2020 09:15:01 +0800
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
References: <20201124143848.874894-1-antonio.borneo@st.com>
 <20201124230756.887925-1-antonio.borneo@st.com>
 <d62710c3-7813-7506-f209-fcfa65931778@huawei.com>
 <f24476cc-39f0-ea5f-d6af-faad481e3235@huawei.com>
 <20201125170714.GK1551@shell.armlinux.org.uk>
From: Yonglong Liu <liuyonglong@huawei.com>
Message-ID: <3fdb1d11-d59e-9d3d-a5a8-8f20e4ca7f0a@huawei.com>
Date: Thu, 26 Nov 2020 09:15:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.0.1
MIME-Version: 1.0
In-Reply-To: <20201125170714.GK1551@shell.armlinux.org.uk>
Content-Language: en-US
X-Originating-IP: [10.57.36.170]
X-ClientProxiedBy: dggeme715-chm.china.huawei.com (10.1.199.111) To
 dggeme760-chm.china.huawei.com (10.3.19.106)
X-CFilter-Loop: Reflected
Cc: Andrew Lunn <andrew@lunn.ch>, Salil Mehta <salil.mehta@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 linuxarm@huawei.com, Willy Liu <willy.liu@realtek.com>,
 linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3 net-next] net: phy: realtek: read
 actual speed on rtl8211f to detect downshift
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGksIFJ1c3NlbGw6CgogwqDCoMKgIEkgZm91bmQgdGhpcyBtZXNzYWdlIGluIGtlcm5lbCBsb2cs
IHRoYW5rcyEKCk9uIDIwMjAvMTEvMjYgMTowNywgUnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4IGFk
bWluIHdyb3RlOgo+IE9uIFRodSwgTm92IDI2LCAyMDIwIGF0IDEyOjU3OjM3QU0gKzA4MDAsIFlv
bmdsb25nIExpdSB3cm90ZToKPj4gSGksIEFudG9uaW86Cj4+Cj4+ICDCoMKgwqAgQ291bGQgeW91
IGhlbHAgdG8gcHJvdmlkZSBhIGRvd25zaGlmdCB3YXJuaW5nIG1lc3NhZ2Ugd2hlbiB0aGlzIGhh
cHBlbj8KPj4KPj4gIMKgwqDCoCBJdCdzIGEgbGl0dGxlIHN0cmFuZ2UgdGhhdCB0aGUgYWR2IGFu
ZCB0aGUgbHBhIHN1cHBvcnQgMTAwME0sIGJ1dAo+PiBmaW5hbGx5IHRoZSBsaW5rIHNwZWVkIGlz
IDEwME0uCj4gVGhhdCBpcyBhbiBpZGVudGlmeWluZyBmZWF0dXJlIG9mIGRvd25zaGlmdC4KPgo+
IERvd25zaGlmdCBjYW4gaGFwcGVuIGF0IGVpdGhlciBlbmQgb2YgdGhlIGxpbmssIGFuZCBzaW5j
ZSB3ZSBtdXN0IG5vdAo+IGNoYW5nZSB0aGUgIkFkdmVydGlzZWQgbGluayBtb2RlcyIgc2luY2Ug
dGhpcyBpcyB3aGF0IHVzZXJzcGFjZQo+IGNvbmZpZ3VyZWQsIGlmIGEgZG93bnNoaWZ0IG9jY3Vy
cyBhdCB0aGUgbG9jYWwgZW5kLCB0aGVuIHlvdSB3aWxsIGdldAo+IHRoZSBldGh0b29sIG91dHB1
dCB5b3UgcHJvdmlkZSwgd2hlcmUgdGhlIHNwZWVkIGRvZXMgbm90IGFncmVlIHdpdGgKPiB0aGUg
cmVwb3J0ZWQgYWR2ZXJ0aXNlbWVudHMuCj4KPiBZb3Ugc2hvdWxkIGFscmVhZHkgYmUgZ2V0dGlu
ZyBhIHdhcm5pbmcgaW4gdGhlIGtlcm5lbCBsb2cgd2hlbiB0aGlzCj4gaGFwcGVuczsgcGh5X2No
ZWNrX2Rvd25zaGlmdCgpIHdoaWNoIGlzIHBhcnQgb2YgdGhlIHBoeWxpYiBjb3JlIGNvZGUKPiB3
aWxsIGNoZWNrIHRoaXMgZXZlcnkgdGltZSB0aGUgbGluayBjb21lcyB1cC4gWW91IHNob3VsZCBh
bHJlYWR5Cj4gaGF2ZSBhIG1lc3NhZ2UgIkRvd25zaGlmdCBvY2N1cnJlZCAuLi4iIGluIHlvdXIg
a2VybmVsIGxvZy4gUGxlYXNlCj4gY2hlY2suCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
