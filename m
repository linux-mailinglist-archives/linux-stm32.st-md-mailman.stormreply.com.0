Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB622C3423
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Nov 2020 23:41:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED089C56631;
	Tue, 24 Nov 2020 22:41:29 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4966BC5662F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Nov 2020 22:41:28 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id k1so455375eds.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Nov 2020 14:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=h5/NEGcRaQbxARJ7pOs7y+QOBtL6oZcm2nApnzpGIeU=;
 b=tisrnfnNV0MN7LKo+eRixINZfF2YyukdJ0mMUJ/faW/TTm+THkoK/9rTFT6saK6c0v
 fCmT8ebTjTuvp7GAgfDeYjDhXA9qpVAcD0eLtNWOa/PvZstDDhiZuPkTUIRA7OvPgVsW
 KdGGnVcvaiRuXoOu7iPaNuAF7UmPR+0oeDvYRCHgmonTUblHbzyqxC+P2BJ6Q/MvLnuS
 WgYBwa7QJoRlsx9qbxJdLaTsAsWMxqPy7dwYiXHI2NONni3isuzTAnP/yTnlkclnSz8G
 dRVNyWu97UBvK/Q8qw4EUvMtcg1nOd79KmIRahpAsySX+txQw7dFiKwlbldjD49XS67V
 8D7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=h5/NEGcRaQbxARJ7pOs7y+QOBtL6oZcm2nApnzpGIeU=;
 b=qrvk6R2jAZvFB/nnjCtk538msyOHge1jcvxecQG9TRf5QVI5E8dkgOIdZwL4joGCap
 BnfuNVA/uibZVB3K7jnxs+kPS6JBLoDJxNfKHQWVl4iQMZ1C4rwUgpjfM6J5kz7oOysm
 m6vpxi/KBQWGPZz77Yfk/8MjJEvHnFdkP1sbRtmTKeYJG6yg+Kg9gUgiVB8y3O3wrHaP
 g5jWy/Pph7VQfF+RT7jtaw3hoYCeBmzKYoSDrWXxvcaI5G9mbVas/4UzHnVIPzkMIR4p
 TXc9OHEklQzhf1btKxBXBLJHkBOrUYq1DEkklON0cpvTISASD45o63WkrPkv1c9DLRXP
 CMrw==
X-Gm-Message-State: AOAM533K+d6RM684bhS6fSwB6kX/F5vxshnJ37imoi1SEjG30MX8geBi
 h3xJ13fUcnmg5uoK9j79WU8=
X-Google-Smtp-Source: ABdhPJwuPDJI1WZoraBmg8raCR7kxU3Wd02gqO0CY0qzV+l7YVW3chHPqsco8qNktNOn2N1x4J7ZQA==
X-Received: by 2002:aa7:d8c4:: with SMTP id k4mr740838eds.248.1606257688414;
 Tue, 24 Nov 2020 14:41:28 -0800 (PST)
Received: from ?IPv6:2003:ea:8f23:2800:145e:bd05:1fb8:712a?
 (p200300ea8f232800145ebd051fb8712a.dip0.t-ipconnect.de.
 [2003:ea:8f23:2800:145e:bd05:1fb8:712a])
 by smtp.googlemail.com with ESMTPSA id dk4sm136419edb.54.2020.11.24.14.41.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 14:41:27 -0800 (PST)
To: Antonio Borneo <antonio.borneo@st.com>, Andrew Lunn <andrew@lunn.ch>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Yonglong Liu <liuyonglong@huawei.com>,
 Willy Liu <willy.liu@realtek.com>
References: <20201124143848.874894-1-antonio.borneo@st.com>
 <20201124215932.885306-1-antonio.borneo@st.com>
 <7d8bf728-7d73-fa8c-d63d-49e9e6c872fd@gmail.com>
 <57457fcd335e7d6bfd543187de02608bcccf812f.camel@st.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <b469247f-607b-6f92-9f09-9ce345ca6f61@gmail.com>
Date: Tue, 24 Nov 2020 23:41:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <57457fcd335e7d6bfd543187de02608bcccf812f.camel@st.com>
Cc: linux-kernel@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>,
 linuxarm@huawei.com, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] net: phy: realtek: read actual speed
 on rtl8211f to detect downshift
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

QW0gMjQuMTEuMjAyMCB1bSAyMzozMyBzY2hyaWViIEFudG9uaW8gQm9ybmVvOgo+IE9uIFR1ZSwg
MjAyMC0xMS0yNCBhdCAyMzoyMiArMDEwMCwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+PiBBbSAy
NC4xMS4yMDIwIHVtIDIyOjU5IHNjaHJpZWIgQW50b25pbyBCb3JuZW86Cj4+PiBUaGUgcnRsODIx
MWYgc3VwcG9ydHMgZG93bnNoaWZ0IGFuZCBiZWZvcmUgY29tbWl0IDU1MDJiMjE4ZTAwMQo+Pj4g
KCJuZXQ6IHBoeTogdXNlIHBoeV9yZXNvbHZlX2FuZWdfbGlua21vZGUgaW4gZ2VucGh5X3JlYWRf
c3RhdHVzIikKPj4+IHRoZSByZWFkLWJhY2sgb2YgcmVnaXN0ZXIgTUlJX0NUUkwxMDAwIHdhcyB1
c2VkIHRvIGRldGVjdCB0aGUKPj4+IG5lZ290aWF0ZWQgbGluayBzcGVlZC4KPj4+IFRoZSBjb2Rl
IGFkZGVkIGluIGNvbW1pdCBkNDQ1ZGZmMmRmNjAgKCJuZXQ6IHBoeTogcmVhbHRlazogcmVhZAo+
Pj4gYWN0dWFsIHNwZWVkIHRvIGRldGVjdCBkb3duc2hpZnQiKSBpcyB3b3JraW5nIGZpbmUgYWxz
byBmb3IgdGhpcwo+Pj4gcGh5IGFuZCBpdCdzIHRyaXZpYWwgcmUtdXNpbmcgaXQgdG8gcmVzdG9y
ZSB0aGUgZG93bnNoaWZ0Cj4+PiBkZXRlY3Rpb24gb24gcnRsODIxMWYuCj4+Pgo+Pj4gQWRkIHRo
ZSBwaHkgc3BlY2lmaWMgcmVhZF9zdGF0dXMoKSBwb2ludGluZyB0byB0aGUgZXhpc3RpbmcKPj4+
IGZ1bmN0aW9uIHJ0bGdlbl9yZWFkX3N0YXR1cygpLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFu
dG9uaW8gQm9ybmVvIDxhbnRvbmlvLmJvcm5lb0BzdC5jb20+Cj4+PiBMaW5rOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzQ3OGY4NzFhLTU4M2QtMDFmMS05Y2M1LTJlZWE1NmQ4YzJhN0BodWF3
ZWkuY29tCj4+PiAtLS0KPj4+IFRvOiBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+Cj4+PiBU
bzogSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4KPj4+IFRvOiBSdXNzZWxs
IEtpbmcgPGxpbnV4QGFybWxpbnV4Lm9yZy51az4KPj4+IFRvOiAiRGF2aWQgUy4gTWlsbGVyIiA8
ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4KPj4+IFRvOiBKYWt1YiBLaWNpbnNraSA8a3ViYUBrZXJuZWwu
b3JnPgo+Pj4gVG86IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcKPj4+IFRvOiBZb25nbG9uZyBMaXUg
PGxpdXlvbmdsb25nQGh1YXdlaS5jb20+Cj4+PiBUbzogV2lsbHkgTGl1IDx3aWxseS5saXVAcmVh
bHRlay5jb20+Cj4+PiBDYzogbGludXhhcm1AaHVhd2VpLmNvbQo+Pj4gQ2M6IFNhbGlsIE1laHRh
IDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPgo+Pj4gQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KPj4+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4+
PiBJbi1SZXBseS1UbzogPDIwMjAxMTI0MTQzODQ4Ljg3NDg5NC0xLWFudG9uaW8uYm9ybmVvQHN0
LmNvbT4KPj4+Cj4+PiBWMSA9PiBWMgo+Pj4gCW1vdmUgZnJvbSBhIGdlbmVyaWMgaW1wbGVtZW50
YXRpb24gYWZmZWN0aW5nIGV2ZXJ5IHBoeQo+Pj4gCXRvIGEgcnRsODIxMWYgc3BlY2lmaWMgaW1w
bGVtZW50YXRpb24KPj4+IC0tLQo+Pj4gwqBkcml2ZXJzL25ldC9waHkvcmVhbHRlay5jIHwgMSAr
Cj4+PiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pj4KPj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL25ldC9waHkvcmVhbHRlay5jIGIvZHJpdmVycy9uZXQvcGh5L3JlYWx0ZWsuYwo+
Pj4gaW5kZXggNTc1NTgwZDNmZmUwLi44ZmY4YTRlZGMxNzMgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2
ZXJzL25ldC9waHkvcmVhbHRlay5jCj4+PiArKysgYi9kcml2ZXJzL25ldC9waHkvcmVhbHRlay5j
Cj4+PiBAQCAtNjIxLDYgKzYyMSw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGh5X2RyaXZlciByZWFsdGVr
X2RydnNbXSA9IHsKPj4+IMKgCQlQSFlfSURfTUFUQ0hfRVhBQ1QoMHgwMDFjYzkxNiksCj4+PiDC
oAkJLm5hbWUJCT0gIlJUTDgyMTFGIEdpZ2FiaXQgRXRoZXJuZXQiLAo+Pj4gwqAJCS5jb25maWdf
aW5pdAk9ICZydGw4MjExZl9jb25maWdfaW5pdCwKPj4+ICsJCS5yZWFkX3N0YXR1cwk9IHJ0bGdl
bl9yZWFkX3N0YXR1cywKPj4+IMKgCQkuYWNrX2ludGVycnVwdAk9ICZydGw4MjExZl9hY2tfaW50
ZXJydXB0LAo+Pj4gwqAJCS5jb25maWdfaW50cgk9ICZydGw4MjExZl9jb25maWdfaW50ciwKPj4+
IMKgCQkuc3VzcGVuZAk9IGdlbnBoeV9zdXNwZW5kLAo+Pj4KPj4+IGJhc2UtY29tbWl0OiA5YmQy
NzAyZDI5MmNiN2I1NjViMDllOTQ5ZDMwMjg4YWI3YTI2ZDUxCj4+Pgo+Pgo+PiBQZWZlY3Qgd291
bGQgYmUgdG8gbWFrZSB0aGlzIGEgZml4IGZvciA1NTAyYjIxOGUwMDEsCj4+IGJ1dCBydGxnZW5f
cmVhZF9zdGF0dXMoKSB3YXMgYWRkZWQgb25lIHllYXIgYWZ0ZXIgdGhpcyBjaGFuZ2UuCj4+IE1h
cmtpbmcgdGhlIGNoYW5nZSB0aGF0IGFkZGVkIHJ0bGdlbl9yZWFkX3N0YXR1cygpIGFzICJGaXhl
cyIKPj4gd291bGQgYmUgdGVjaG5pY2FsbHkgb2ssIGJ1dCBhcyBpdCdzIG5vdCBhY3R1YWxseSBi
cm9rZW4gbm90Cj4+IGV2ZXJ5Ym9keSBtYXkgYmUgaGFwcHkgd2l0aCB0aGlzLgo+PiBIYXZpbmcg
c2FpZCB0aGF0IEknZCBiZSBmaW5lIHdpdGggdHJlYXRpbmcgdGhpcyBhcyBhbiBpbXByb3ZlbWVu
dCwKPj4gZG93bnNoaWZ0IHNob3VsZCBiZSBhIHJhcmUgY2FzZS4KPiAKPiBDb3JyZWN0ISBCZWlu
ZyB0aGUgY29tbWl0IHRoYXQgYWRkcyBydGxnZW5fcmVhZF9zdGF0dXMoKSBhbiBpbXByb3ZlbWVu
dCwKPiBzaG91bGQgbm90IGJlIGJhY2twb3J0ZWQsIHNvIHRoaXMgcGF0Y2ggaXMgbm90IG1hcmtl
ZCBhbnltb3JlIGFzIGEgZml4IQo+IFBsdXMsIHRoaXMgZG9lcyBub3QgZml4IDU1MDJiMjE4ZTAw
MSBpbiB0aGUgZ2VuZXJhbCBjYXNlLCBidXQgbGltaXRlZCB0bwo+IG9uZSBzcGVjaWZpYyBwaHks
IG1ha2luZyB0aGUgJ2ZpeGVzJyBsYWJlbCBsZXNzIHJlbGV2YW50Lgo+IEFueXdheSwgdGhlIGNv
bW1pdCBtZXNzYWdlIHJlcG9ydHMgYWxsIHRoZSBpbmdyZWRpZW50cyBmb3IgYSBiYWNrcG9ydC4K
PiAKPiBCeSB0aGUgd2F5LCBJIGhhdmUgaW5jb3JyZWN0bHkgc2VudCB0aGlzIGJhc2VkIG9uIG5l
dGRldiwgYnV0IGl0J3Mgbm90IGEKPiBmaXggYW55bW9yZSEgU2hvdWxkIEkgcmViYXNlIGl0IG9u
IG5ldGRldi1uZXh0IGFuZCByZXNlbmQ/Cj4gCkZvciB0aGlzIHNtYWxsIGNoYW5nZSBpdCBzaG91
bGRuJ3QgbWFrZSBhIGRpZmZlcmVuY2Ugd2hldGhlciBpdCdzIGJhc2VkCm9uIG5ldCBvciBuZXQt
bmV4dC4gSSBkb24ndCB0aGluayBhbnl0aGluZyBoYXMgY2hhbmdlZCBoZXJlLiBCdXQgYmV0dGVy
CmNoZWNrIHdoZXRoZXIgcGF0Y2ggYXBwbGllcyBjbGVhbmx5IG9uIG5ldC1uZXh0LiBQYXRjaCBz
aG91bGQgaGF2ZSBiZWVuCmFubm90YXRlZCBhcyBbUEFUQ0ggbmV0LW5leHRdLCBidXQgSSB0aGlu
ayBhIHJlLXNlbmQgaXNuJ3QgbmVlZGVkIGFzCkpha3ViIGNhbiBzZWUgaXQgYmFzZWQgb24gdGhp
cyBjb21tdW5pY2F0aW9uLgoKPiBBbnRvbmlvCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
