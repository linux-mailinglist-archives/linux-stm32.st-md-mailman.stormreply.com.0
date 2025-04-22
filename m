Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7C2A9764D
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Apr 2025 21:58:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A245C78F61;
	Tue, 22 Apr 2025 19:58:07 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71CA8C78034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 19:58:06 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-47688ae873fso58144221cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 12:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745351885; x=1745956685;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wi0XCQ0wIgKNjQqJTUBlgswWdaLbIuH1pbfLDZVamA8=;
 b=Nr2NpsEZdORvwgq6lFV11YXdPcdvW9TBfjFVxSHSNkFR23zsMuY9wuppXSuTIjzkWq
 Jw8UZjPYrjabq2gyRopxSMQaFw4hjz6/jicBAFLSkv34zKymqUxsFE9GJuPi/fSmQ5T9
 /RT3Q7r7mSeciCPxfl0OfclXAMm971G25aAtryYV6dmzp67+kmLoi5upVD4GZywv/OlP
 OubAI/OR9Vp/TRQm7X00GEM3iKGqH66uOkzZeNcUvdajNkROnAjyD8H1uKhT7XTlEnVl
 9+eNOGberZKnGG0g4qKsTF7fFoYExesMdZp7tdY0uVngqWntXuk0bx5/d1Ot9hU1Pv/E
 2FMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745351885; x=1745956685;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wi0XCQ0wIgKNjQqJTUBlgswWdaLbIuH1pbfLDZVamA8=;
 b=FsXXhACs05i+PEXjHBKT6Wck4pxY3gKNNiP2sWMA4vWOVLqmSTmN7xQvNzu3T7Fzet
 uVlNVB7t15pClEBiI6Io3SbCOVj6j+AkV3ySy/e9gUg3m0PYNEiJHme0LmHAOW/fHZsh
 ZkOWTp+blJXy7jYDMnLqmx/oSGD33dA7smjAxrICaMRL8bqHrvkoOfFFCcn20fD3TT5h
 vqaZz6j+VQLP+DvWJ51Tgy4IWPclvGC0mXr6DbL8RsqrLUG5bUkxEnyVXBTYIlEN/zb+
 VrF1Vy062BcQjF3dvT+y7nRUl/qy7Z63IfI7wAA/r3qfYx4fXc/1w1lzZ/URbpUICyBS
 p65A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlEEVxC4s+atMc60mFwRF9SlslgZPeylKgEbz2qYVZOvp6ey9ZHm8OOZgJ6l2WpEUlN6sKrxXdFi5rPw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywpbhqx0vEVDZH0m8xUpeWZYIHH5pgU3oM6qzUoTlCx4jI3BTXa
 nIjkRB/77QJsbS7TyoDr/WCFX9XE4SS7eiWNk4OBmJX9yrO52R290gqfZQsTmfc=
X-Gm-Gg: ASbGncsrYSDkAFZ0QlCV+4oJ73+9IYu9inr3TmUndWdWXfOWYF3BgztReqPAkXMq7tL
 RIjAHlUgtoBWVX/7feHcKLtYG6qziJRsOBw8Bmp9/QhazRNkC+OpgUatHfdRuIpY8D7Q73WmkwN
 eNnVY8cIrkBCP2bFJxP3t585bJBe/PAeAaaXwR0VSKfjEA9S95EmOShItsI438DquAXcJuVE+lu
 a4uXAxBOoWX1o09xbSMtRfp/6tEk7SKmEg/TbXS+G8XqyCl2Ld6gNAedJL/4Ab/UitsFF2BcWX9
 dC/HXq/FUkmSrAbN9rg0haJBJphpDMUgEh2Z0Gr65BmjtQ==
X-Google-Smtp-Source: AGHT+IF7avo9uEX7A3mW4T8l6RGnGWjnOiUes3AEZlicK2QwGeYThk0IGDXmi5oRWeE+79xJPQKX3w==
X-Received: by 2002:a05:6214:19c8:b0:6e8:fad9:c688 with SMTP id
 6a1803df08f44-6f2c4552a03mr278764626d6.16.1745351884909; 
 Tue, 22 Apr 2025 12:58:04 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f2c2af1433sm61506056d6.19.2025.04.22.12.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 12:58:04 -0700 (PDT)
Message-ID: <529a9804d5b14322b2be78ea6f98677db9c23c33.camel@ndufresne.ca>
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Sebastian Fricke	
 <sebastian.fricke@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>, 
 Erling Ljunggren <hljunggr@cisco.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart	 <laurent.pinchart@ideasonboard.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Jean-Michel Hautbois
 <jeanmichel.hautbois@ideasonboard.com>,  Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
Date: Tue, 22 Apr 2025 15:58:02 -0400
In-Reply-To: <20241121131904.261230-4-hugues.fruchet@foss.st.com>
References: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
 <20241121131904.261230-4-hugues.fruchet@foss.st.com>
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
Subject: Re: [Linux-stm32] [PATCH v3 3/3] media: verisilicon: postproc: 4K
	support
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

SGksCgpMZSBqZXVkaSAyMSBub3ZlbWJyZSAyMDI0IMOgIDE0OjE5ICswMTAwLCBIdWd1ZXMgRnJ1
Y2hldCBhIMOpY3JpdMKgOgo+IFN1cHBvcnQgaW5wdXQgbGFyZ2VyIHRoYW4gNDA5NngyMDQ4IHVz
aW5nIGV4dGVuZGVkIGlucHV0IHdpZHRoL2hlaWdodAo+IGZpZWxkcyBvZiBzd3JlZzkyLgo+IFRo
aXMgaXMgbmVlZGVkIHRvIGRlY29kZSBsYXJnZSBXZWJQIG9yIEpQRUcgcGljdHVyZXMuCj4gCj4g
U2lnbmVkLW9mZi1ieTogSHVndWVzIEZydWNoZXQgPGh1Z3Vlcy5mcnVjaGV0QGZvc3Muc3QuY29t
PgoKUmV2aWV3ZWQtYnk6IE5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFi
b3JhLmNvbT4KCj4gLS0tCj4gwqBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL2hh
bnRyby5owqDCoMKgwqDCoMKgwqDCoMKgIHwgMiArKwo+IMKgZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS92ZXJpc2lsaWNvbi9oYW50cm9fZzFfcmVncy5owqAgfCAyICstCj4gwqBkcml2ZXJzL21lZGlh
L3BsYXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRyb19wb3N0cHJvYy5jIHwgNiArKysrKy0KPiDCoDMg
ZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRyby5oIGIvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm8uaAo+IGluZGV4IDgxMTI2MGRj
M2M3Ny4uZDEzMzdmNzc0MmU0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
dmVyaXNpbGljb24vaGFudHJvLmgKPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3Zlcmlz
aWxpY29uL2hhbnRyby5oCj4gQEAgLTMyMSw2ICszMjEsOCBAQCBzdHJ1Y3QgaGFudHJvX3Bvc3Rw
cm9jX3JlZ3Mgewo+IMKgCXN0cnVjdCBoYW50cm9fcmVnIG91dHB1dF9mbXQ7Cj4gwqAJc3RydWN0
IGhhbnRyb19yZWcgb3JpZ193aWR0aDsKPiDCoAlzdHJ1Y3QgaGFudHJvX3JlZyBkaXNwbGF5X3dp
ZHRoOwo+ICsJc3RydWN0IGhhbnRyb19yZWcgaW5wdXRfd2lkdGhfZXh0Owo+ICsJc3RydWN0IGhh
bnRyb19yZWcgaW5wdXRfaGVpZ2h0X2V4dDsKPiDCoH07Cj4gwqAKPiDCoHN0cnVjdCBoYW50cm9f
dnA5X2RlY29kZWRfYnVmZmVyX2luZm8gewo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRyb19nMV9yZWdzLmggYi9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL3ZlcmlzaWxpY29uL2hhbnRyb19nMV9yZWdzLmgKPiBpbmRleCBlN2Q0ZGI3ODhlNTcuLmY2
ZTViYmViMTkxNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZlcmlzaWxp
Y29uL2hhbnRyb19nMV9yZWdzLmgKPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3Zlcmlz
aWxpY29uL2hhbnRyb19nMV9yZWdzLmgKPiBAQCAtMzUxLDcgKzM1MSw3IEBACj4gwqAjZGVmaW5l
wqDCoMKgwqAgRzFfUkVHX1BQX0NPTlRST0xfT1VUX1dJRFRIKHYpICgoKHYpIDw8IDQpICYgR0VO
TUFTSygxNCwgNCkpCj4gwqAjZGVmaW5lIEcxX1JFR19QUF9NQVNLMV9PUklHX1dJRFRICUcxX1NX
UkVHKDg4KQo+IMKgI2RlZmluZcKgwqDCoMKgIEcxX1JFR19QUF9PUklHX1dJRFRIKHYpCSgoKHYp
IDw8IDIzKSAmIEdFTk1BU0soMzEsIDIzKSkKPiAtI2RlZmluZSBHMV9SRUdfUFBfRElTUExBWV9X
SURUSAkJRzFfU1dSRUcoOTIpCj4gKyNkZWZpbmUgRzFfUkVHX1BQX0RJU1BMQVlfV0lEVEhfSU5f
RVhUCUcxX1NXUkVHKDkyKQo+IMKgI2RlZmluZSBHMV9SRUdfUFBfRlVTRQkJCUcxX1NXUkVHKDk5
KQo+IMKgCj4gwqAjZW5kaWYgLyogSEFOVFJPX0cxX1JFR1NfSF8gKi8KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9fcG9zdHByb2MuYyBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24vaGFudHJvX3Bvc3Rwcm9jLmMKPiBpbmRl
eCAyMzJjOTNlZWE3ZWUuLjg0YzhlMjg3NDcwZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRyb19wb3N0cHJvYy5jCj4gKysrIGIvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9fcG9zdHByb2MuYwo+IEBAIC00OSw3ICs0
OSw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGFudHJvX3Bvc3Rwcm9jX3JlZ3MgaGFudHJvX2cx
X3Bvc3Rwcm9jX3JlZ3MgPSB7Cj4gwqAJLmlucHV0X2ZtdCA9IHtHMV9SRUdfUFBfQ09OVFJPTCwg
MjksIDB4N30sCj4gwqAJLm91dHB1dF9mbXQgPSB7RzFfUkVHX1BQX0NPTlRST0wsIDI2LCAweDd9
LAo+IMKgCS5vcmlnX3dpZHRoID0ge0cxX1JFR19QUF9NQVNLMV9PUklHX1dJRFRILCAyMywgMHgx
ZmZ9LAo+IC0JLmRpc3BsYXlfd2lkdGggPSB7RzFfUkVHX1BQX0RJU1BMQVlfV0lEVEgsIDAsIDB4
ZmZmfSwKPiArCS5kaXNwbGF5X3dpZHRoID0ge0cxX1JFR19QUF9ESVNQTEFZX1dJRFRIX0lOX0VY
VCwgMCwgMHhmZmZ9LAo+ICsJLmlucHV0X3dpZHRoX2V4dCA9IHtHMV9SRUdfUFBfRElTUExBWV9X
SURUSF9JTl9FWFQsIDI2LCAweDd9LAo+ICsJLmlucHV0X2hlaWdodF9leHQgPSB7RzFfUkVHX1BQ
X0RJU1BMQVlfV0lEVEhfSU5fRVhULCAyOSwgMHg3fSwKPiDCoH07Cj4gwqAKPiDCoGJvb2wgaGFu
dHJvX25lZWRzX3Bvc3Rwcm9jKGNvbnN0IHN0cnVjdCBoYW50cm9fY3R4ICpjdHgsCj4gQEAgLTEw
Myw2ICsxMDUsOCBAQCBzdGF0aWMgdm9pZCBoYW50cm9fcG9zdHByb2NfZzFfZW5hYmxlKHN0cnVj
dCBoYW50cm9fY3R4ICpjdHgpCj4gwqAJSEFOVFJPX1BQX1JFR19XUklURSh2cHUsIG91dHB1dF9o
ZWlnaHQsIGN0eC0+ZHN0X2ZtdC5oZWlnaGF0KTsKPiDCoAlIQU5UUk9fUFBfUkVHX1dSSVRFKHZw
dSwgb3JpZ193aWR0aCwgTUJfV0lEVEgoY3R4LT5kc3RfZm10LndpZHRoKSk7Cj4gwqAJSEFOVFJP
X1BQX1JFR19XUklURSh2cHUsIGRpc3BsYXlfd2lkdGgsIGN0eC0+ZHN0X2ZtdC53aWR0aCk7Cj4g
KwlIQU5UUk9fUFBfUkVHX1dSSVRFKHZwdSwgaW5wdXRfd2lkdGhfZXh0LCBNQl9XSURUSChjdHgt
PmRzdF9mbXQud2lkdGgpID4+IDkpOwo+ICsJSEFOVFJPX1BQX1JFR19XUklURSh2cHUsIGlucHV0
X2hlaWdodF9leHQsIE1CX0hFSUdIVChjdHgtPmRzdF9mbXQuaGVpZ2h0ID4+IDgpKTsKPiDCoH0K
PiDCoAo+IMKgc3RhdGljIGludCBkb3duX3NjYWxlX2ZhY3RvcihzdHJ1Y3QgaGFudHJvX2N0eCAq
Y3R4KQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
