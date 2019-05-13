Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B14C01B154
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 09:42:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64E06C5B640
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 07:42:41 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FB14C5AB9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2019 07:42:40 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id o4so14017592wra.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2019 00:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=WERxYzDoS7P0TiPMnvs6x/f95pNMjt2W3p3cXcDJuWk=;
 b=kvhlvPfaHsa2MhLBhlzN7ZeqLc6aNYNtJBpYSOQKMsDjCAV+R3yRNJ+onuLlEL2J0X
 oYeAXvLUyL8GROw/z9W8YdM4VDloh9xKvUi1nVau3ujGsJOJl4DlPaxHmyMpHoYXl2IO
 dj9ZgBVKalBU7BXJwdNbcO/0SfwprNvDDdDk6y5dlhu6Jd2N36ZQvySXgTDSOH3Q82jA
 9OhWkB6B11IOCXhuuQTx6CfPZ5qO3BKywDaYzakxLVNEevUtSznDiWOBvttXz5BvhX53
 GZo86ZkOwe2fuuHlpLC3BFVvIUlkD7QfBxOBtjtUOlt2bRLGyx4S1Me1+MtdiWFWcuJK
 1POA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=WERxYzDoS7P0TiPMnvs6x/f95pNMjt2W3p3cXcDJuWk=;
 b=F5zVS6yXP5JC4jdmpOi0uWPzUH0BT0f4gfjPLBTR436i/G8q61FQJhJBX7KQO6UCVV
 UPvFEvLWYPQDiTovilz4vtIEikOapEwrPAgMTlqPbWZD1nChQ8qCwJqRslk8uh0tblD5
 V9R+lshU6js9Xa/Gng2PfmEVT5T20oQDeLeSS2jl+VmDMEf8joVvkUKVEa8lEDk+zecX
 bMQbv6gVIYTfQCMnyigd5QzNng/IuvW0l++4fziKujJUr+PIhD7tYy52k8YdAsTydJ35
 2sd2DW0Na7tAYOUCIBYwh/sM4hyHaZq3fbJUUQkBjt8beaLdYieWz8DKcOX/VywKpeaW
 IcMg==
X-Gm-Message-State: APjAAAXaatuo+3d4/vKjYNtQaMXwISYpjw+htuFUgL1jetuLemdlUdtU
 Q8IgpMtpQor4qRPebEqqzETr9w==
X-Google-Smtp-Source: APXvYqyZozQkpGZHOk4y/a4Pt3SprPlhW3ZxFXrms0vy6bx9PRMxI36vjtz603WWWh1jUgXCNGKShg==
X-Received: by 2002:adf:9e89:: with SMTP id a9mr2157887wrf.78.1557733359560;
 Mon, 13 May 2019 00:42:39 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id t18sm27938340wrg.19.2019.05.13.00.42.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 00:42:38 -0700 (PDT)
Date: Mon, 13 May 2019 08:42:37 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20190513074237.GI4319@dell>
References: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
 <20190510072314.GC7321@dell> <20190510151556.GA4319@dell>
 <20190510151912.GB4319@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190510151912.GB4319@dell>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [GIT PULL v3] Immutable branch between MFD and
 Pinctrl due for the v5.2 merge window
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

RW5qb3khCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGU5M2M5Yzk5YTYyOWM2
MTgzN2Q1YTdmYzIxMjBjZDJiNmM3MGRiZGQ6CgogIExpbnV4IDUuMSAoMjAxOS0wNS0wNSAxNzo0
Mjo1OCAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBn
aXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbGVlL21mZC5naXQg
dGFncy9pYi1tZmQtcGluY3RybC12NS4yLTIKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0
byBkMTdlZDc5N2I4ZmQ1Yzg3NjVjZDk1OWFjNDRhYWEyZjA5MGY1YTg5OgoKICBwaW5jdHJsOiBz
dG1meDogRml4ICd3YXJuOiBiaXR3aXNlIEFORCBjb25kaXRpb24gaXMgZmFsc2UgaGVyZScgKDIw
MTktMDUtMTMgMDg6Mjg6MjYgKzAxMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkltbXV0YWJsZSBicmFuY2ggYmV0d2Vl
biBNRkQgYW5kIFBpbmN0cmwgZHVlIGZvciB0aGUgdjUuMiBtZXJnZSB3aW5kb3cKCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
QW1lbGllIERlbGF1bmF5ICg1KToKICAgICAgZHQtYmluZGluZ3M6IG1mZDogQWRkIFNUIE11bHRp
LUZ1bmN0aW9uIGVYcGFuZGVyIChTVE1GWCkgY29yZSBiaW5kaW5ncwogICAgICBtZmQ6IEFkZCBT
VCBNdWx0aS1GdW5jdGlvbiBlWHBhbmRlciAoU1RNRlgpIGNvcmUgZHJpdmVyCiAgICAgIGR0LWJp
bmRpbmdzOiBwaW5jdHJsOiBkb2N1bWVudCB0aGUgU1RNRlggcGluY3RybCBiaW5kaW5ncwogICAg
ICBwaW5jdHJsOiBBZGQgU1RNRlggR1BJTyBleHBhbmRlciBQaW5jdHJsL0dQSU8gZHJpdmVyCiAg
ICAgIHBpbmN0cmw6IEtjb25maWc6IEZpeCBTVE1GWCBHUElPIGV4cGFuZGVyIFBpbmN0cmwvR1BJ
TyBkcml2ZXIgZGVwZW5kZW5jaWVzCgpMZWUgSm9uZXMgKDIpOgogICAgICBwaW5jdHJsOiBzdG1m
eDogRml4ICd3YXJuOiB1bnNpZ25lZCA8VkFSPiBpcyBuZXZlciBsZXNzIHRoYW4gemVybycKICAg
ICAgcGluY3RybDogc3RtZng6IEZpeCAnd2FybjogYml0d2lzZSBBTkQgY29uZGl0aW9uIGlzIGZh
bHNlIGhlcmUnCgogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zdG1meC50
eHQgICAgfCAgMjggKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9waW5jdHJsLXN0
bWZ4LnR4dCAgfCAxMTYgKysrCiBkcml2ZXJzL21mZC9LY29uZmlnICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAxMyArCiBkcml2ZXJzL21mZC9NYWtlZmlsZSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9tZmQvc3RtZnguYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCA1NDUgKysrKysrKysrKysrKysKIGRyaXZlcnMvcGluY3Ry
bC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDE0ICsKIGRyaXZlcnMvcGlu
Y3RybC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMv
cGluY3RybC9waW5jdHJsLXN0bWZ4LmMgICAgICAgICAgICAgICAgICAgIHwgODE5ICsrKysrKysr
KysrKysrKysrKysrKwogaW5jbHVkZS9saW51eC9tZmQvc3RtZnguaCAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAxMjMgKysrKwogOSBmaWxlcyBjaGFuZ2VkLCAxNjYwIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWZkL3N0bWZ4LnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtc3RtZngudHh0CiBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9tZmQvc3RtZnguYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvcGluY3RybC9waW5jdHJsLXN0bWZ4LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xp
bnV4L21mZC9zdG1meC5oCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNl
cyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3Ig
QVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
