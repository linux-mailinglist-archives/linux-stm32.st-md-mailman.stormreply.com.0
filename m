Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BFE2C2B3B
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Nov 2020 16:26:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E337CC56631;
	Tue, 24 Nov 2020 15:26:53 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2165AC5662F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Nov 2020 15:26:50 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r3so4430390wrt.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Nov 2020 07:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=k+Iagc0aS3/EnNIwiIo6ZqVN4M6qIqWHIstOKgb6RBM=;
 b=TGjvJ/O8mQ4BBtCTUOVEuvsV/ulyv9D3/nkqLq3r4zf6F7FGNZdEDkcWnlyy4a+l7U
 P043tqdh98oNoPbqC//vEqQcPSrD07vn+8jH3FwcRaW6FAVACV6ZPVWYs+UywSdYXPWm
 JD35x6fSFaLzfOKw/PiTl2n1NS9OVamy9frAiCvPPnkoxUNuaObcfq1XcPzxu2xVc4il
 BhoDo2nUI0+EEB1ECp/CaDUJS/LOXHGY5P2Tz94BbS7SbLoT/fGHNUDGgRd2JXRVcA8I
 FgmrO0BpEOffA/txtAGYaVFgaUCs6KQzQZ7oaQvrzP9Dnz9hTvLa30tTHcozdCFFmDf1
 8Hwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=k+Iagc0aS3/EnNIwiIo6ZqVN4M6qIqWHIstOKgb6RBM=;
 b=nF4bwC/NjSC1FsehCq2gbauXreDqtu3gRT8phj8MjiFeEbJVbgzdQ8lN/PbpMkTSVn
 4tzl3FI36gOz02EpmQ21+VnwDVOMCiYcl9oZ0F7Jmynf72ZMhJSncDyMaViflpEVLhMu
 N2zmPWu/+epQbURBg4TtUAB7Fgg8oHhDm4Xd4wN5jxkXYsvcqXZpbkfAu4VlR4YJRwnC
 OFEkQiYMh+KDMaE8SA3nHLt1914bUZDqoW7ECBT5lFjC/u1ElvYzFKsYWTtU94XskLUb
 8cTZjOXc7MGxZw9e+BvrZcjf2VjHRTzRH1uWCMxAjC6TNwkQ0qIY4v+ob/onGL+iqgCr
 d/6Q==
X-Gm-Message-State: AOAM530h0nWmURcefn4wmhuoQRIl8Vto2/uU2Jy9S8ZLegXn2jIAIYFg
 vmVh2Avxy85lb2MBIcStCKc=
X-Google-Smtp-Source: ABdhPJzo+2coZTD3QonwH13kAa3QAamwILg9Hc5MxylE0mG7e5z8jQKj9Ha49b3oHAPAyOhQC2sNtg==
X-Received: by 2002:a5d:4004:: with SMTP id n4mr5768370wrp.230.1606231609659; 
 Tue, 24 Nov 2020 07:26:49 -0800 (PST)
Received: from ?IPv6:2003:ea:8f23:2800:4cf3:cdf5:5d2a:5c8c?
 (p200300ea8f2328004cf3cdf55d2a5c8c.dip0.t-ipconnect.de.
 [2003:ea:8f23:2800:4cf3:cdf5:5d2a:5c8c])
 by smtp.googlemail.com with ESMTPSA id g131sm6426505wma.35.2020.11.24.07.26.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 07:26:49 -0800 (PST)
To: Antonio Borneo <antonio.borneo@st.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>
References: <20201124143848.874894-1-antonio.borneo@st.com>
 <20201124145647.GF1551@shell.armlinux.org.uk>
 <bd83b9c15f6cfed5df90da4f6b50d1a3f479b831.camel@st.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <2dc7ad93-5719-dd8a-44a9-8667a22a3b19@gmail.com>
Date: Tue, 24 Nov 2020 16:26:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <bd83b9c15f6cfed5df90da4f6b50d1a3f479b831.camel@st.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Salil Mehta <salil.mehta@huawei.com>,
 netdev@vger.kernel.org, linuxarm@huawei.com, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Yonglong Liu <liuyonglong@huawei.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] net: phy: fix auto-negotiation in case of
	'down-shift'
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

QW0gMjQuMTEuMjAyMCB1bSAxNjoxNyBzY2hyaWViIEFudG9uaW8gQm9ybmVvOgo+IE9uIFR1ZSwg
MjAyMC0xMS0yNCBhdCAxNDo1NiArMDAwMCwgUnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4IGFkbWlu
IHdyb3RlOgo+PiBPbiBUdWUsIE5vdiAyNCwgMjAyMCBhdCAwMzozODo0OFBNICswMTAwLCBBbnRv
bmlvIEJvcm5lbyB3cm90ZToKPj4+IElmIHRoZSBhdXRvLW5lZ290aWF0aW9uIGZhaWxzIHRvIGVz
dGFibGlzaCBhIGdpZ2FiaXQgbGluaywgdGhlIHBoeQo+Pj4gY2FuIHRyeSB0byAnZG93bi1zaGlm
dCc6IGl0IHJlc2V0cyB0aGUgYml0cyBpbiBNSUlfQ1RSTDEwMDAgdG8KPj4+IHN0b3AgYWR2ZXJ0
aXNpbmcgMUdicHMgYW5kIHJldHJpZXMgdGhlIG5lZ290aWF0aW9uIGF0IDEwME1icHMuCj4+Pgo+
Pj4gRnJvbSBjb21taXQgNTUwMmIyMThlMDAxICgibmV0OiBwaHk6IHVzZSBwaHlfcmVzb2x2ZV9h
bmVnX2xpbmttb2RlCj4+PiBpbiBnZW5waHlfcmVhZF9zdGF0dXMiKSB0aGUgY29udGVudCBvZiBN
SUlfQ1RSTDEwMDAgaXMgbm90IGNoZWNrZWQKPj4+IGFueW1vcmUgYXQgdGhlIGVuZCBvZiB0aGUg
bmVnb3RpYXRpb24sIHByZXZlbnRpbmcgdGhlIGRldGVjdGlvbiBvZgo+Pj4gcGh5ICdkb3duLXNo
aWZ0Jy4KPj4+IEluIGNhc2Ugb2YgJ2Rvd24tc2hpZnQnIHBoeWRldi0+YWR2ZXJ0aXNpbmcgZ2V0
cyBvdXQtb2Ytc3luYyB3cnQKPj4+IE1JSV9DVFJMMTAwMCBhbmQgc3RpbGwgaW5jbHVkZXMgbW9k
ZXMgdGhhdCB0aGUgcGh5IGhhdmUgYWxyZWFkeQo+Pj4gZHJvcHBlZC4gVGhlIGxpbmsgcGFydG5l
ciBjb3VsZCBzdGlsbCBhZHZlcnRpc2UgaGlnaGVyIHNwZWVkcywKPj4+IHdoaWxlIHRoZSBsaW5r
IGlzIGVzdGFibGlzaGVkIGF0IG9uZSBvZiB0aGUgY29tbW9uIGxvd2VyIHNwZWVkcy4KPj4+IFRo
ZSBsb2dpYyAnYW5kJyBpbiBwaHlfcmVzb2x2ZV9hbmVnX2xpbmttb2RlKCkgYmV0d2Vlbgo+Pj4g
cGh5ZGV2LT5hZHZlcnRpc2luZyBhbmQgcGh5ZGV2LT5scF9hZHZlcnRpc2luZyB3aWxsIHJlcG9y
dCBhbgo+Pj4gaW5jb3JyZWN0IG1vZGUuCj4+Pgo+Pj4gSXNzdWUgZGV0ZWN0ZWQgd2l0aCBhIGxv
Y2FsIHBoeSBydGw4MjExZiBjb25uZWN0ZWQgd2l0aCBhIGdpZ2FiaXQKPj4+IGNhcGFibGUgcm91
dGVyIHRocm91Z2ggYSB0d28tcGFpcnMgbmV0d29yayBjYWJsZS4KPj4+Cj4+PiBBZnRlciBhdXRv
LW5lZ290aWF0aW9uLCByZWFkIGJhY2sgTUlJX0NUUkwxMDAwIGFuZCBtYXNrLW91dCBmcm9tCj4+
PiBwaHlkZXYtPmFkdmVydGlzaW5nIHRoZSBtb2RlcyB0aGF0IGhhdmUgYmVlbiBldmVudHVhbGx5
IGRpc2NhcmRlZAo+Pj4gZHVlIHRvIHRoZSAnZG93bi1zaGlmdCcuCj4+Cj4+IFNvcnJ5LCBidXQg
bm8uIFdoaWxlIHlvdXIgc29sdXRpb24gd2lsbCBhcHBlYXIgdG8gd29yaywgaW4KPj4gaW50cm9k
dWNlcyB1bmV4cGVjdGVkIGNoYW5nZXMgdG8gdGhlIHVzZXIgdmlzaWJsZSBBUElzLgo+Pgo+Pj4g
wqAJaWYgKHBoeWRldi0+YXV0b25lZyA9PSBBVVRPTkVHX0VOQUJMRSAmJiBwaHlkZXYtPmF1dG9u
ZWdfY29tcGxldGUpIHsKPj4+ICsJCWlmIChwaHlkZXYtPmlzX2dpZ2FiaXRfY2FwYWJsZSkgewo+
Pj4gKwkJCWFkdiA9IHBoeV9yZWFkKHBoeWRldiwgTUlJX0NUUkwxMDAwKTsKPj4+ICsJCQlpZiAo
YWR2IDwgMCkKPj4+ICsJCQkJcmV0dXJuIGFkdjsKPj4+ICsJCQkvKiB1cGRhdGUgYWR2ZXJ0aXNp
bmcgaW4gY2FzZSBvZiAnZG93bi1zaGlmdCcgKi8KPj4+ICsJCQltaWlfY3RybDEwMDBfbW9kX2xp
bmttb2RlX2Fkdl90KHBoeWRldi0+YWR2ZXJ0aXNpbmcsCj4+PiArCQkJCQkJCWFkdik7Cj4+Cj4+
IElmIGEgZG93bi1zaGlmdCBvY2N1cnMsIHRoaXMgd2lsbCBjYXVzZSB0aGUgY29uZmlndXJlZCBh
ZHZlcnRpc2luZwo+PiBtYXNrIHRvIGxvc2UgdGhlIDFHIHNwZWVkLCB3aGljaCB3aWxsIGJlIHZp
c2libGUgdG8gdXNlcnNwYWNlLgo+IAo+IFlvdSBhcmUgcmlnaHQsIGl0IGdldHMgcHJvcGFnYXRl
ZCB0byB1c2VyIHRoYXQgMUdicHMgaXMgbm90IGFkdmVydGlzZWQKPiAKPj4gVXNlcnNwYWNlIGRv
ZXNuJ3QgZXhwZWN0IHRoZSBhZHZlcnRpc2luZyBtYXNrIHRvIGNoYW5nZSBiZW5lYXRoIGl0Lgo+
PiBTaW5jZSB1cGRhdGVzIGZyb20gdXNlcnNwYWNlIGFyZSBkb25lIHVzaW5nIGEgcmVhZC1tb2Rp
Znktd3JpdGUgb2YKPj4gdGhlIGtzZXR0aW5ncywgdGhpcyBjYW4gaGF2ZSB0aGUgdW5kZXNpcmVk
IGVmZmVjdCBvZiByZW1vdmluZyAxRwo+PiBmcm9tIHRoZSBjb25maWd1cmVkIGFkdmVydGlzaW5n
IG1hc2suCj4+Cj4+IFdlJ3ZlIGhhZCBvdGhlciBQSFlzIGhhdmUgdGhpcyBiZWhhdmlvdXI7IHRo
ZSBjb3JyZWN0IHNvbHV0aW9uIGlzIGZvcgo+PiB0aGUgUEhZIGRyaXZlciB0byBpbXBsZW1lbnQg
cmVhZGluZyB0aGUgcmVzb2x1dGlvbiBmcm9tIHRoZSBQSFkgcmF0aGVyCj4+IHRoYW4gcmVseWlu
ZyBvbiB0aGUgZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbiBpZiBpdCBjYW4gZG93bi1zaGlmdAo+IAo+
IElmIGl0J3MgYWxyZWFkeSB1cHN0cmVhbSwgY291bGQgeW91IHBsZWFzZSBwb2ludCB0byBvbmUg
b2YgdGhlIHBoeSBkcml2ZXIKPiB0aGF0IGFscmVhZHkgaW1wbGVtZW50cyB0aGlzIHByb3Blcmx5
Pwo+IAoKU2VlIGUuZy4gYXFyMTA3X3JlYWRfcmF0ZSgpLCB1c2VkIGJ5IGFxcjEwN19yZWFkX3N0
YXR1cygpLgoKPiBUaGFua3MKPiBBbnRvbmlvCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
