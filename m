Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD46172AC
	for <lists+linux-stm32@lfdr.de>; Wed,  8 May 2019 09:35:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A413C36B3F
	for <lists+linux-stm32@lfdr.de>; Wed,  8 May 2019 07:35:00 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E8BEC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 May 2019 07:34:58 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id a17so8208996iot.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 May 2019 00:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=06vNhGWmXv8aMKwZVKHjsvRsD+uYUkrBPC/S7+NBkoE=;
 b=apWVfaiDZ1exPIwVVASJ59UGwhjBA1P2k6aCr1J79HXmlETcO4h4+8A3DyPvaXxtP6
 fw4y8+fGxb4LyrRdyX+6xiWjwG389N+mdjgKCCb4W7AVXEmhrcudC6rHkrGHLri0BdjL
 I4NTI4Y6kDVR9F9So8ZW2+jhqhA52TSCtIhHdf9uPULVaqUzAliGmBdCYqZZn+R9xaD+
 3UePL7TQHw3sRBUHY9X8AhEQurjjCJTYQ7WD/B6gu3tTQsJ0lqTKqWbvpSNpj3zo6Krf
 /UA+vaCQYxMCjOBotAe90BID+G/PPngIBiWd/w3YfQjLYX487puI1u8KsX/QtxyHLFO1
 e/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=06vNhGWmXv8aMKwZVKHjsvRsD+uYUkrBPC/S7+NBkoE=;
 b=WZjbsNIzyevfHxVrKPewHf2HqlbkfW02lWMbpGhJOe3pMT6xrEkoi/hBp+43U1cJxd
 iRBMoeyeq+xmsdUR0tE2xm4sHEVplJO0AiuR2SjHLy4q3/+R9KPf4h45SRUeFPvkD0r+
 vyYtsA0sjobIFHtlPG3v7aAVy6553XsEFVfmrt13K9By6aRNys93vmun3VNeykHRguzh
 KYCswmhf3AtVw2mj/JgOG9KyQUVrZZVljh3xHJochnMo0i8b4Yq3KCPE9fC9iNKh6wt/
 AURxbUQubI1wGrdM+BMDJbwZQm0whgITOncnPAaiAnTy+rHl8Z1m/CIAHxLwFEeuv4VO
 A2AQ==
X-Gm-Message-State: APjAAAVosYQyfF8u3IpeRjkP0XsE4udRf1l76UOzKttp/gmH68Y1eBm2
 0RnvL/mrGqFqVmQTxvdl0RM=
X-Google-Smtp-Source: APXvYqwF9H/7HCZIz5Tn+Hj7eOSVa+HOFngsAGECdBjmi6GEuIUO3hqq+2bK57608GUBAZptqroXbQ==
X-Received: by 2002:a6b:5814:: with SMTP id m20mr11060978iob.293.1557300897335; 
 Wed, 08 May 2019 00:34:57 -0700 (PDT)
Received: from icarus ([2001:268:c1c0:b600:c70:4af9:86e2:2])
 by smtp.gmail.com with ESMTPSA id 81sm799787itv.23.2019.05.08.00.34.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 May 2019 00:34:56 -0700 (PDT)
Date: Wed, 8 May 2019 16:34:34 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Message-ID: <20190508073434.GA3277@icarus>
References: <20190507091224.17781-1-benjamin.gaignard@st.com>
 <20190507101729.GA3420@icarus>
 <CA+M3ks4LhOFTeArnh3d=C02qLJWj_u6tWDDOhD8kZnJPRkXC8w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+M3ks4LhOFTeArnh3d=C02qLJWj_u6tWDDOhD8kZnJPRkXC8w@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] IIO: stm32: Remove quadrature related
 functions from trigger driver
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

T24gVHVlLCBNYXkgMDcsIDIwMTkgYXQgMDI6Mzc6MDdQTSArMDIwMCwgQmVuamFtaW4gR2FpZ25h
cmQgd3JvdGU6Cj4gTGUgbWFyLiA3IG1haSAyMDE5IMOgIDEyOjE5LCBXaWxsaWFtIEJyZWF0aGl0
dCBHcmF5Cj4gPHZpbGhlbG0uZ3JheUBnbWFpbC5jb20+IGEgw6ljcml0IDoKPiA+Cj4gPiBPbiBU
dWUsIE1heSAwNywgMjAxOSBhdCAxMToxMjoyNEFNICswMjAwLCBCZW5qYW1pbiBHYWlnbmFyZCB3
cm90ZToKPiA+ID4gUXVhZHJhdHVyZSBmZWF0dXJlIGlzIG5vdyBob3N0ZWQgb24gaXQgb3duIGZy
YW1ld29yay4KPiA+ID4gUmVtb3ZlIHF1YWRyYXR1cmUgcmVsYXRlZCBjb2RlIGZyb20gc3RtMzIt
dHJpZ2dlciBkcml2ZXIgdG8gYXZvaWQKPiA+ID4gY29kZSBkdXBsaWNhdGlvbiBhbmQgc2ltcGxp
ZnkgdGhlIEFCSS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR2FpZ25hcmQg
PGJlbmphbWluLmdhaWduYXJkQHN0LmNvbT4KPiA+Cj4gPiBBbHRob3VnaCB0aGlzIGZ1bmN0aW9u
YWxpdHkgaXMgbm93IHByb3ZpZGVkIGJ5IHRoZSBDb3VudGVyIHN1YnN5c3RlbSwgd2UKPiA+IHNo
b3VsZCBrZWVwIHRoZSBJSU8gQ291bnRlciBpbnRlcmZhY2UgZm9yIHRoaXMgZHJpdmVyIGludGFj
dCBzaW5jZQo+ID4gZXhpc3RpbmcgdXNlciBhcHBsaWNhdGlvbnMgbWF5IGRlcGVuZCBvbiBpdDsg
dGhpcyBpcyB0aGUgc2FtZSByZWFzb24gd2h5Cj4gPiB0aGUgSUlPIENvdW50ZXIgY29kZSBpbiB0
aGUgMTA0LVFVQUQtOCBkZXZpY2UgZHJpdmVyIHdhcyBub3QgcmVtb3ZlZAo+ID4gZGVzcGl0ZSBt
b3ZpbmcgdG8gdGhlIENvdW50ZXIgc3Vic3lzdGVtLgo+ID4KPiA+IE9uY2UgdXNlciBhcHBsaWNh
dGlvbnMgaGF2ZSBoYWQgZW5vdWdoIHRpbWUgdG8gbWlncmF0ZSB0byB0aGUgR2VuZXJpYwo+ID4g
Q291bnRlciBpbnRlcmZhY2UsIHdlIGNhbiBjb25zaWRlciByZW1vdmluZyB0aGUgZGVwcmVjYXRl
ZCBJSU8gQ291bnRlcgo+ID4gaW50ZXJmYWNlLgo+IAo+IEhpIFdpbGxpYW0sCj4gCj4gVGhpcyBT
b0MgaXMgbm90IHlldCBpbiBwcm9kdWN0aW9uIHNvIHRoZWlyIGlzIG5vIGxlZ2FjeSBvbiB0aGUg
b2xkIGludGVyZmFjZQo+IGFuZCBJIHdvdWxkIGxpa2UgdG8gYXZvaWQgdG8gY3JlYXRlIG9uZS4K
PiAKPiBCZW5qYW1pbgoKQWgsIEkgc2VlIHdoYXQgeW91IG1lYW4sIHRoaXMgZHJpdmVyIGlzIGZv
ciBmdXR1cmUgZGV2aWNlcy4gRG8gdGhlCmVhcmxpZXIgU1RNMzIgSDcgc2VyaWVzIGRldmljZXMg
aGF2ZSBhIHF1YWRyYXR1cmUgZmVhdHVyZSBhcyB3ZWxsLCBvciBpcwp0aGlzIGZ1bmN0aW9uYWxp
dHkgb25seSBhdmFpbGFibGUgd2l0aCB0aGUgbmV3IGRldmljZXM/CgpXaWxsaWFtIEJyZWF0aGl0
dCBHcmF5Cgo+IAo+ID4KPiA+IFdpbGxpYW0gQnJlYXRoaXR0IEdyYXkKPiA+Cj4gPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gbGludXgtYXJtLWtl
cm5lbCBtYWlsaW5nIGxpc3QKPiA+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
cm0ta2VybmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
