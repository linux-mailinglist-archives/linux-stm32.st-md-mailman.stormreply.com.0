Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E41374353
	for <lists+linux-stm32@lfdr.de>; Wed,  5 May 2021 19:08:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08F31C5718F;
	Wed,  5 May 2021 17:08:15 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD083C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 May 2021 17:08:13 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id e2so1444127plh.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 May 2021 10:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=KqluyOf0v1Nfvw8tjGqNoVG2n8oF6SCT4knHdkJWdw8=;
 b=rQOS41TIPlQG5WalvX2KW0aggD6QWtRn7Cac+JrNjjU4tOtHDmXvDCAB0Uszi15xOL
 OyIGY6jSIFuE7lw/R4QjotkHvMtJa/lRy+fy/sW7aTLpQZC452jbHoGgoiUm113X5eqR
 6QECMGmgs4AvDVwaLGUx3mxZ+EPhUbtYDadW7Fh7l5R7k0uLz2Cf1V87BQqK6MEvNBIa
 KcJGcMdGu16C6PnOLBHKcqfXDhwS7IYP4ZwyOhjDsXGpX7bRnwyBugcYbQT0NOmvmIN8
 TKFW9gtVDiRaUS5t1ys7S7FxUQhFqTnHljceapXECDwpQ7UnK8hlSzJmhm1UqHMwuJOs
 P6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KqluyOf0v1Nfvw8tjGqNoVG2n8oF6SCT4knHdkJWdw8=;
 b=VaykYizEPzx6cWjucrmzmP0oVZdFXjvJ2uHHtryTpps1nOyhuYo4tkFp5HfFnn1Ra4
 HE8NH/0sEa1vnZMOWI64dwgmpAhkPg8pvnRl6cBR1qEidzzBphXL9RRGV/iHDRk+U4d3
 GfboHO7JTrhBl4DvK4b4A+yYHvjYUJ3OmRdOMGGC3WzwXZyzN5G+15XFiHzP1+OhIEQI
 y9W9GRpCN6Imaxp08Cs7IIqBpkLOUCgJIDOuHKR4xwHfQvFsbdkuN+lRKTUZbIc6fXYx
 ykl3SL7oRS7M6CuDRQx8d98cnR2YzqQ0RWa+la4okSlyAXKaJ4HUK1ibyqbUu3a3FRJ7
 0BNw==
X-Gm-Message-State: AOAM531mWZfe3fDcjtq4cPHGb1GcEmGUXd9g4CbqdFSjsHQvDa91PPu9
 /KqvbY3mWnuZWiwKsdZGzL+H0g==
X-Google-Smtp-Source: ABdhPJx312lbW6tgvqqvI1A8dmQe2ssQyXiW13Spas4G8E74K6JFnYAzdraGylncRKHxnbDhDfRmJA==
X-Received: by 2002:a17:90a:fa0e:: with SMTP id
 cm14mr12548463pjb.59.1620234486823; 
 Wed, 05 May 2021 10:08:06 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id f14sm9039081pjq.50.2021.05.05.10.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 10:08:06 -0700 (PDT)
Date: Wed, 5 May 2021 11:08:04 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <20210505170804.GC1766375@xps15>
References: <20210429080639.6379-1-arnaud.pouliquen@foss.st.com>
 <20210503174238.GD1699665@xps15>
 <b2f6b9ca-9dc2-920b-941d-175779bc1034@foss.st.com>
 <20210504170530.GD1734971@xps15>
 <7170fdd0-00cd-1486-7b4c-41040ecfff6f@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7170fdd0-00cd-1486-7b4c-41040ecfff6f@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] rpmsg: char: Remove useless includes
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

T24gVHVlLCBNYXkgMDQsIDIwMjEgYXQgMDg6MjA6MjVQTSArMDIwMCwgQXJuYXVkIFBPVUxJUVVF
TiB3cm90ZToKPiAKPiAKPiBPbiA1LzQvMjEgNzowNSBQTSwgTWF0aGlldSBQb2lyaWVyIHdyb3Rl
Ogo+ID4gSGkgQXJuYXVkLAo+ID4gCj4gPiBbLi4uXQo+ID4gCj4gPj4KPiA+PiBJIHN0YXJ0ZWQg
YnkgdGhpcyBvbmUgYW5kIHRoZW4gSSBnb3QgY2FycmllZCBhd2F5IHRlc3RlZCB0aGUgb3RoZXIg
aW5jbHVkZS4uLgo+ID4+IFlvdSBhcmUgcmlnaHQsIEkganVzdCBkb24ndCBmb2xsb3cgaGVyIHRo
ZSBmaXJzdCBydWxlIG9mIHRoZSAic3VibWl0IGNoZWNrbGlzdCIKPiA+Pgo+ID4+ICJJZiB5b3Ug
dXNlIGEgZmFjaWxpdHkgdGhlbiAjaW5jbHVkZSB0aGUgZmlsZSB0aGF0IGRlZmluZXMvZGVjbGFy
ZXMgdGhhdAo+ID4+IGZhY2lsaXR5LiBEb27igJl0IGRlcGVuZCBvbiBvdGhlciBoZWFkZXIgZmls
ZXMgcHVsbGluZyBpbiBvbmVzIHRoYXQgeW91IHVzZS4iCj4gPj4KPiA+PiBUaGF0IHNhaWQgSSBq
dXN0IGhhdmUgYSBkb3VidCBmb3IgdWFwaS9saW51eC9ycG1zZy5oIHRoYXQgd2lsbCBiZSBpbmNs
dWRlCj4gPj4gYnkgcnBtc2cuaFsyXSwgYXMgdGhlc2UgaW5jbHVkZXMgYXJlIHBhcnQgb2YgdGhl
IHJwbXNnIGZyYW1ld29yayBBUEksIHNob3VsZCB3ZQo+ID4+IGtlZXAgYm90aCwgY29uc2lkZXJp
bmcgdGhlIHJ1bGUgYXMgc3RyaWN0Pwo+ID4gCj4gPiBJIHJlZCB0aGUgbGFzdCBwYXJhZ3JhcGgg
c2V2ZXJhbCB0aW1lcyBJIGNhbid0IHVuZGVyc3RhbmQgd2hhdCB5b3UgYXJlCj4gPiB0cnlpbmcg
dG8gY29udmV5LiAgUGxlYXNlIHJlcGhyYXNlLCBwcm92aWRlIG1vcmUgY29udGV4dCBvciBkZXRh
aWwgZXhhY3RseSB3aGVyZQo+ID4geW91IHRoaW5rIHdlIGhhdmUgYSBwcm9ibGVtLgo+IAo+IFRo
ZXJlIGlzIG5vIHByb2JsZW0sIGp1c3QgYSBxdWVzdGlvbiBiZWZvcmUgc2VuZGluZyBhbiB1cGRh
dGUuCj4gCj4gQXMgeW91IG1lbnRpb24gdGhlICNpbmNsdWRlICJycG1zZ19pbnRlcm5hbC5oIiBs
aW5lIGNhbiBiZSByZW1vdmVkLCBJIHBsYW4gdG8KPiBzZW5kIGEgcGF0Y2ggVjIgZm9yIHRoaXMu
Cj4gCj4gVGhhdCdzIHNhaWQgYmVmb3JlIHNlbmRpbmcgYSBuZXcgdmVyc2lvbiBJIHdvdWxkIGxp
a2UgdG8gcHJvcG9zZSB0byBhbHNvIHJlbW92ZQo+IHRoZSAjaW5jbHVkZSAgPHVhcGkvbGludXgv
cnBtc2cuaD4gbGluZS4KPiAKPiBUaGUgcmF0aW9uYWwgdG8gcmVtb3ZlIGl0IGlzIHRoYXQgaW5j
bHVkZS9ycG1zZy5oIHdvdWxkIGFscmVhZHkgaW5jbHVkZQo+IDx1YXBpL2xpbnV4L3JwbXNnLmg+
IGluIDUuMTMgWzJdLiBBbmQgbG9va2luZyBhdCBzb21lIGZyYW1ld29ya3MgKGUuZyBJMkMsIFRU
WSkKPiB0aGUgZHJpdmVycyBzZWVtIHRvIGluY2x1ZGUgb25seSB0aGUgaW5jbHVkZS94eHguaCBh
bmQgbm90IHRoZSB1YXBpL2xpbnV4L3h4eC5oCj4gaW4gc3VjaCBjYXNlLgo+IAo+IFNvIG15IHF1
ZXN0aW9uIGlzIHNob3VsZCBJIHJlbW92ZSAgI2luY2x1ZGUgIDx1YXBpL2xpbnV4L3JwbXNnLmg+
IGxpbmU/IE9yIGRvCj4geW91IHByZWZlciB0aGF0IGkga2VlcCBpdD8KClRoYW5rcyBmb3IgdGhl
IGNsYXJpZmljYXRpb25zLCB0aGlzIGlzIG11Y2ggbXVjaCBiZXR0ZXIuCgpMZXNzIGNoYW5nZXMg
aXMgYWx3YXlzIHByZWZlcnJlZCwgc28gdW5sZXNzIHRoZXJlIGlzIGEgY2xlYXIgZ3VpZGVsaW5l
IG9yIGEgZ29vZApyZWFzb24gdG8gbWFrZSBhIGNoYW5nZSBJIHdvdWxkIHByZWZlciB0byBrZWVw
IHRoaW5ncyB0aGUgd2F5IHRoZXkgYXJlLgoKPiAKPiBIb3BlIGl0IGlzIG1vcmUgY2xlYXIuLi4g
ZWxzZSBwbGVhc2UganVzdCBmb3JnZXQgbXkgcHJvcG9zYWwsIEkgd291bGRuJ3Qgd2FudAo+IHlv
dSB0byB3YXN0ZSB0b28gbXVjaCB0aW1lIGZvciBhIHBvaW50IG9mIGRldGFpbC4KPiAKPiBUaGFu
a3MsCj4gQXJuYXVkCj4gCj4gPiAKPiA+IFRoYW5rcywKPiA+IE1hdGhpZXUKPiA+IAo+ID4gCj4g
Pj4KPiA+PiBbMV0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vz
cy9zdWJtaXQtY2hlY2tsaXN0Lmh0bWwKPiA+PiBbMl0KPiA+PiBodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmVtb3RlcHJvYy9wYXRjaC8yMDIxMDMxMTE0MDQxMy4z
MTcyNS0zLWFybmF1ZC5wb3VsaXF1ZW5AZm9zcy5zdC5jb20vCj4gPj4KPiA+PiBUaGFua3MsCj4g
Pj4gQXJuYXVkCj4gPj4KPiA+Pj4KPiA+Pj4gVGhhbmtzLAo+ID4+PiBNYXRoaWV1Cj4gPj4+Cj4g
Pj4+PiAgCj4gPj4+PiAgI2RlZmluZSBSUE1TR19ERVZfTUFYCShNSU5PUk1BU0sgKyAxKQo+ID4+
Pj4gIAo+ID4+Pj4gLS0gCj4gPj4+PiAyLjE3LjEKPiA+Pj4+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
