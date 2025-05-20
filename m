Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4588BABCED6
	for <lists+linux-stm32@lfdr.de>; Tue, 20 May 2025 07:56:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E58A1C7A820;
	Tue, 20 May 2025 05:56:57 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9DCDC78F8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 May 2025 00:12:34 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-47666573242so841751cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 May 2025 17:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1747699954; x=1748304754;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XSOzuf4zM3x/LvxSKSjkkww83y4Ey5iG99RHEpA5ilY=;
 b=bCn4cPCL9/WlEGYs4noo00rF7t3rrOwtOTrEtLTo45PcbkILUHo2HXl+0SjnNb9tHG
 esam/+Z8ynVj3gL1evEobd2OmrGQMwhldbdmGXw21L5rQ8wAm5VTPokd+B1sEsR/WIiQ
 dVI+cSTZDAvNu2GHHWf5KIUCksCBa9qxTyrwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747699954; x=1748304754;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XSOzuf4zM3x/LvxSKSjkkww83y4Ey5iG99RHEpA5ilY=;
 b=ObvDxbXm/F8QdHpHDmuJ6TeWeJ7R9qLuEDAl0z9Cf6/ZSCE7FM6TjIs0ZURy2PtVzn
 wN01lkfe8M7Y1bMfzyHibmLQAU4rPPFT1ogziMeI/PVjFCqyavCConEfHwOhL1b/eJEa
 LW1f0wzf+6kxFckaKcbbvuhSCwDtERdUHiML5nU33lLxT402kBxYYLAvRdgJROCB9Hoj
 N2N/91V8/+TTWG+QCIgXZmj3RWqXN0IgelM9+9cmFZwHvviqRs4xe01um7Q8pMbfmpp7
 fnyXq8X5LEwc6mnGSwLHMIUsIHfV7R9ZWTwQ08QNh8h0JhvTmQBaF95hisX7L2SbdzWL
 2ElA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxiqB+WEaRh6ZmVp78I0gB5qsZKGt6GCBiTA4g0FO1mmuIM5Q1cB+6ikb6wsaUyy2gRCAP2/mxzvZmlw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx1oH82wwtAksjl0lc7fVKQjrGzm6PDcfiVmKzzCpE0WtuESQaj
 ubgtWbuhhrp6ps5fcfxqdZNshgDfaRya4qd9ctmperVckkPic7GSaIkJDldcAZbLBhpeQLHbQY8
 jqVVSBFQRPrPg8lCNlRp1Ud/ijgawoUqcyYOHG75F
X-Gm-Gg: ASbGnctgW/3ORmN4cBPGvxqWveFHFQT9mZWBDu2CBlzhenWt/BxmqwPxGD7nNrEFY1C
 q9//GTLPBzegJ6aPnzGcVB4DvLO+IzNnm0t0EVCMf6MRk67fPHlbDAp+UjD8oStGANjFe61PFmT
 gytKlkH+Z6rZIZwlhWkG9yFuLN7BqReTNXfq7dm/M3VuVmSxeluYQ=
X-Google-Smtp-Source: AGHT+IGeiEqytsKfbvcOJoATsM9r1IDoSbSawj6sJz4yq7+zFCOByAUS9aOucjOKsanjqRavnKGD/ACfZHzBtCS7E5k=
X-Received: by 2002:a05:622a:4a:b0:478:f8ac:8adf with SMTP id
 d75a77b69052e-49601270e9bmr8144761cf.19.1747699953197; Mon, 19 May 2025
 17:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250519170055.205544-1-antonio.borneo@foss.st.com>
 <df2124f7-8df9-4fb3-b687-5968805c668a@roeck-us.net>
In-Reply-To: <df2124f7-8df9-4fb3-b687-5968805c668a@roeck-us.net>
From: Julius Werner <jwerner@chromium.org>
Date: Mon, 19 May 2025 17:12:20 -0700
X-Gm-Features: AX0GCFuJfn0H6VbpxEdzZcu5Pm6YQSV9kAZ5ya8oZZA3CzSoInnwOJUz-Vgz-14
Message-ID: <CAODwPW-gEOotp8KGhzk3E11PqF9xdan8dOwxe_SW4txh+uQp=w@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
X-Mailman-Approved-At: Tue, 20 May 2025 05:56:56 +0000
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 Evan Benn <evanbenn@chromium.org>, Julius Werner <jwerner@chromium.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] watchdog: arm_smc_wdt: get wdt status
	through SMCWD_GET_TIMELEFT
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

SSBkb24ndCByZWFsbHkga25vdyBhYm91dCB0aGUgaXNzdWUgR3VlbnRlciBtZW50aW9uZWQsIGJ1
dCBvdGhlcndpc2UsCmZyb20gdGhlIGRyaXZlcidzIHNpZGUgdGhpcyBsb29rcyBnb29kIHRvIG1l
LgoKUmV2aWV3ZWQtYnk6IEp1bGl1cyBXZXJuZXIgPGp3ZXJuZXJAY2hyb21pdW0ub3JnPgoKT24g
TW9uLCBNYXkgMTksIDIwMjUgYXQgMTA6NTjigK9BTSBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vj
ay11cy5uZXQ+IHdyb3RlOgo+Cj4gT24gNS8xOS8yNSAxMDowMCwgQW50b25pbyBCb3JuZW8gd3Jv
dGU6Cj4gPiBUaGUgb3B0aW9uYWwgU01DV0RfR0VUX1RJTUVMRUZUIGNvbW1hbmQgY2FuIGJlIHVz
ZWQgdG8gZGV0ZWN0IGlmCj4gPiB0aGUgd2F0Y2hkb2cgaGFzIGFscmVhZHkgYmVlbiBzdGFydGVk
Lgo+ID4gU2VlIHRoZSBpbXBsZW1lbnRhdGlvbiBpbiBPUC1URUUgc2VjdXJlIE9TIFsxXS4KPiA+
Cj4gPiBJZiBDT05GSUdfV0FUQ0hET0dfSEFORExFX0JPT1RfRU5BQkxFRCBpcyBzZXQsIGF0IHBy
b2JlIHRpbWUgY2hlY2sKPiA+IGlmIHRoZSB3YXRjaGRvZyBpcyBhbHJlYWR5IHN0YXJ0ZWQgYW5k
IHRoZW4gc2V0IFdET0dfSFdfUlVOTklORyBpbgo+ID4gdGhlIHdhdGNoZG9nIHN0YXR1cy4gVGhp
cyB3aWxsIGNhdXNlIHRoZSB3YXRjaGRvZyBmcmFtZXdvcmsgdG8KPiA+IHBpbmcgdGhlIHdhdGNo
ZG9nIHVudGlsIGEgdXNlcnNwYWNlIHdhdGNoZG9nIGRhZW1vbiB0YWtlcyBvdmVyIHRoZQo+ID4g
Y29udHJvbC4KPiA+Cj4gPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vT1AtVEVFL29wdGVlX29z
L2NvbW1pdC9hN2YyZDRiZDg2MzIgWzFdCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW50b25pbyBC
b3JuZW8gPGFudG9uaW8uYm9ybmVvQGZvc3Muc3QuY29tPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMv
d2F0Y2hkb2cvYXJtX3NtY193ZHQuYyB8IDE4ICsrKysrKysrKysrKysrKy0tLQo+ID4gICAxIGZp
bGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9hcm1fc21jX3dkdC5jIGIvZHJpdmVycy93YXRjaGRv
Zy9hcm1fc21jX3dkdC5jCj4gPiBpbmRleCA4ZjNkMGMzYTAwNWZiLi5mMTI2OGY0MzMyN2VhIDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy93YXRjaGRvZy9hcm1fc21jX3dkdC5jCj4gPiArKysgYi9k
cml2ZXJzL3dhdGNoZG9nL2FybV9zbWNfd2R0LmMKPiA+IEBAIC00Niw2ICs0Niw4IEBAIHN0YXRp
YyBpbnQgc21jd2RfY2FsbChzdHJ1Y3Qgd2F0Y2hkb2dfZGV2aWNlICp3ZGQsIGVudW0gc21jd2Rf
Y2FsbCBjYWxsLAo+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsKPiA+ICAgICAgIGlm
IChyZXMtPmEwID09IFBTQ0lfUkVUX0lOVkFMSURfUEFSQU1TKQo+ID4gICAgICAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKPiA+ICsgICAgIGlmIChyZXMtPmEwID09IFBTQ0lfUkVUX0RJU0FCTEVE
KQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVOT0RBVEE7Cj4gPiAgICAgICBpZiAocmVzLT5h
MCAhPSBQU0NJX1JFVF9TVUNDRVNTKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVJTzsKPiA+
ICAgICAgIHJldHVybiAwOwo+ID4gQEAgLTEzMSwxMCArMTMzLDIwIEBAIHN0YXRpYyBpbnQgc21j
d2RfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+Cj4gPiAgICAgICB3ZGQt
PmluZm8gPSAmc21jd2RfaW5mbzsKPiA+ICAgICAgIC8qIGdldF90aW1lbGVmdCBpcyBvcHRpb25h
bCAqLwo+ID4gLSAgICAgaWYgKHNtY3dkX2NhbGwod2RkLCBTTUNXRF9HRVRfVElNRUxFRlQsIDAs
IE5VTEwpKQo+ID4gLSAgICAgICAgICAgICB3ZGQtPm9wcyA9ICZzbWN3ZF9vcHM7Cj4gPiAtICAg
ICBlbHNlCj4gPiArICAgICBlcnIgPSBzbWN3ZF9jYWxsKHdkZCwgU01DV0RfR0VUX1RJTUVMRUZU
LCAwLCBOVUxMKTsKPiA+ICsgICAgIHN3aXRjaCAoZXJyKSB7Cj4gPiArICAgICBjYXNlIDA6Cj4g
PiArICAgICAgICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19XQVRDSERPR19IQU5ETEVfQk9P
VF9FTkFCTEVEKSkKPiA+ICsgICAgICAgICAgICAgICAgICAgICBzZXRfYml0KFdET0dfSFdfUlVO
TklORywgJndkZC0+c3RhdHVzKTsKPgo+IFRoaXMgaXMgdGhlIHdyb25nIHVzZSBvZiB0aGlzIGNv
bmZpZ3VyYXRpb24gb3B0aW9uLiBJdCBpcyBvbmx5IG5lZWRlZAo+IGluIGEgZHJpdmVyIGlmIHRo
ZSB3YXRjaGRvZyBzdGF0dXMgY2FuIG5vdCBiZSByZWFkIGZyb20gaGFyZHdhcmUuCj4gVGhhdCBp
cyBub3QgdGhlIGNhc2UgaGVyZS4gV29yc2UsIHVzaW5nIGl0IGluIGEgZHJpdmVyIGxpa2UgdGhp
cwo+IG92ZXJyaWRlcyB0aGUgd2F0Y2hkb2cgY29yZSBtb2R1bGUgcGFyYW1ldGVyICJoYW5kbGVf
Ym9vdF9lbmFibGVkIi4KPgo+IEd1ZW50ZXIKPgo+ID4gKyAgICAgICAgICAgICBmYWxsdGhyb3Vn
aDsKPiA+ICsgICAgIGNhc2UgLUVOT0RBVEE6Cj4gPiAgICAgICAgICAgICAgIHdkZC0+b3BzID0g
JnNtY3dkX3RpbWVsZWZ0X29wczsKPiA+ICsgICAgICAgICAgICAgYnJlYWs7Cj4gPiArICAgICBk
ZWZhdWx0Ogo+ID4gKyAgICAgICAgICAgICB3ZGQtPm9wcyA9ICZzbWN3ZF9vcHM7Cj4gPiArICAg
ICAgICAgICAgIGJyZWFrOwo+ID4gKyAgICAgfQo+ID4gKwo+ID4gICAgICAgd2RkLT50aW1lb3V0
ID0gcmVzLmEyOwo+ID4gICAgICAgd2RkLT5tYXhfdGltZW91dCA9IHJlcy5hMjsKPiA+ICAgICAg
IHdkZC0+bWluX3RpbWVvdXQgPSByZXMuYTE7Cj4gPgo+ID4gYmFzZS1jb21taXQ6IGE1ODA2Y2Q1
MDZhZjVhN2MxOWJjZDU5NmU0NzA4YjVjNDY0YmZkMjEKPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
