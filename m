Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A315B99F906
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2024 23:24:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DA47C78030;
	Tue, 15 Oct 2024 21:24:51 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28AA7C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 21:24:44 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2fb5638dd57so22867911fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 14:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729027483; x=1729632283;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PhjciV57JA1oiSvqUGGOuUTneeyKGywd3NuDYX8iNpU=;
 b=FVWqP9wBZXizwnoTSwLcU+euy9ELJHLh/iaqpUCfxZHLVCsB6OebtYX4FwSCpTMXTs
 Aslk/U3AcP99x2Id+11boksk5x/BBld5BjGmFNTiYlaRaBbB7uKMryky8eb4cCYSQ22h
 1olQvvZvOHhLBZ8kD+xcrsqArve6vtcUAhUeVQTHNqHwIqslZzgu+YLrC4EyuVAuKhu2
 ouh892m0A0JhXM/R2Je+vIyGbO7B2TqIGF4hT0muf76GxoeQHi4je3PBP5UOz++pFARh
 GuWfCdbcwrBcOd3N/jeWBInmbx4OHKfrwsTT7+58EU9zqX1WGECRxfv+fC1qMlusjavo
 jVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729027483; x=1729632283;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PhjciV57JA1oiSvqUGGOuUTneeyKGywd3NuDYX8iNpU=;
 b=lUMevtSOhLqKPyc/YtA2dWZq0YKqbDw60HG/mxSM+MbQi5xycbyM4L7pXB7Yx1zWb3
 a7KcsV8jbAK5SumvHkwRt3rc13OIWV1nlop10zAdBdFe7BnIV7FLOSvIW5mClMQHITfO
 ojdeqZMYa3FLnOagptMCvZiTGMyEB2sQ1zsgRWqrWo5DvBMuV91QPSeRX52xjOvLbUaL
 aNKFbkffnt2k8BQALb5dUjPyEylANvB1E6lKidFxE4G95WurBW509wQJCALiIYAgtX3/
 5IKDU0BcyOSouxTJr3KkqbaJNXxWUvB+LOgMjojxDJau7gsuzuxaipnDqhhKbw7G+H9U
 SnZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcqXwKojMvMALsRRg8wcCvGxHwx6ISVi4dEwkyqrp45W8NZkfEMB2PRTNmXVy86obH1PeqADwE0yXT4A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzqK5yyncktx2KqYX4Gpvv0X56P6VDfkESI5jjcRAZKvS0VCvvk
 zRniZHFQikq8wKU0QsVVBqozmRpCionuSrsQyxDeEn5Vk7xIgTO1aF0ZRqAoq0lMdKYHDqLiIhv
 oQm9dc3TuLxNyTZGiPo6OFu5vexrq9oCWy5+ZPA==
X-Google-Smtp-Source: AGHT+IF1R3ln9ac3U0sfakzsuNbOd+0ROdsV4OC8ZJQYCQZp67tLpSmpVzQ89WN+TtVyocJi0Q1Race8vWOhGwQH26c=
X-Received: by 2002:a2e:4c1a:0:b0:2fb:6198:d230 with SMTP id
 38308e7fff4ca-2fb61b510b1mr9173781fa.18.1729027483126; Tue, 15 Oct 2024
 14:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <a1a1d062-f3a2-4d05-9836-3b098de9db6d@foss.st.com>
 <Zw5D2aTkkUVOK89g@J2N7QTR9R3>
 <CACRpkdY79nbBoaHe6ijuyJS9dDduNw_sv1J90pz121YDgCvC3Q@mail.gmail.com>
 <Zw51fhCkmCYrTOeV@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXEcLD3PWd-9osjo9AOe5Jg-NMOmJ8afB_x7VeboueLoeQ@mail.gmail.com>
 <Zw59x0LVS-kvs9Jv@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXEnhHkxywh8TH1i=fmyAR8cXZ8D-rvV43X-N7GpCf2Axw@mail.gmail.com>
 <Zw6Jk74-d0mhR0jx@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXG3bwMGpArYNUm-qMO7PPgb3--wy5kp-3Ks2Uv9M479xg@mail.gmail.com>
 <Zw6X9KQT0-z7r7SY@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXGGmsWs2XpM7zLURjKp67Uz2ePi1pSV1=rPCMgviLVUgw@mail.gmail.com>
 <CACRpkdYjeqaRzz+hBOGGLEAJn5QmFGof2ysQuVNC_+vV49WPRw@mail.gmail.com>
In-Reply-To: <CACRpkdYjeqaRzz+hBOGGLEAJn5QmFGof2ysQuVNC_+vV49WPRw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Oct 2024 23:24:31 +0200
Message-ID: <CACRpkdaTfrAwd8yzZLZHfuu7SB0pUTHZ9kUJq+2c2C8RSqpN9w@mail.gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Kees Cook <kees@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] Crash on armv7-a using KASAN
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

T24gVHVlLCBPY3QgMTUsIDIwMjQgYXQgMTA6NTXigK9QTSBMaW51cyBXYWxsZWlqIDxsaW51cy53
YWxsZWlqQGxpbmFyby5vcmc+IHdyb3RlOgo+IE9uIFR1ZSwgT2N0IDE1LCAyMDI0IGF0IDc6Mjji
gK9QTSBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPiB3cm90ZToKPgo+ID4gPiBGcm9t
IGEgc3VwZXJmaWNpYWwgbG9vaywgaXQgc291bmRzIGxpa2UgaXQgc2hvdWxkIGJlIHBvc3NpYmxl
IHRvIGV4dGVuZAo+ID4gPiB0aGF0IHRvIGFsc28gaGFuZGxlIHRoZSBLQVNBTiBzaGFkb3cgb2Yg
dGhlIHZtYWxsb2MgYXJlYSAod2hpY2gKPiA+ID4gX19jaGVja192bWFsbG9jX3NlcSgpIGN1cnJl
bnRseSBkb2Vzbid0IGNvcHkpLCBidXQgSSdtIG5vdCBzdXJlIG9mCj4gPiA+IGV4YWN0bHkgd2hl
biB3ZSBpbml0aWFsaXNlIHRoZSBzaGFkb3cgZm9yIGEgdm1hbGxvYyBhbGxvY2F0aW9uIHJlbGF0
aXZlCj4gPiA+IHRvIHVwZGF0aW5nIHZtYWxsb2Nfc2VxLgo+ID4KPiA+IEluZGVlZC4gSXQgYXBw
ZWFycyBib3RoIHZtYWxsb2Nfc2VxKCkgYW5kIGFyY2hfc3luY19rZXJuZWxfbWFwcGluZ3MoKQo+
ID4gbmVlZCB0byB0YWtlIHRoZSB2bWFsbG9jIHNoYWRvdyBpbnRvIGFjY291bnQgc3BlY2lmaWNh
bGx5Lgo+Cj4gSSdtIHRyeWluZyB0byBsb29rIGludG8gdGhhdC4KCkkgZml4ZWQgdGhhdCB0b28g
YW5kIG5vdyB0aGUgS0FTQU4gaXMgc3RhYmlsaXplZC4gSSdsbCBzZW5kIG91dCB0aGUKcGF0Y2hl
cyBzbyB3ZSBnZXQgc29tZXRoaW5nIHRvIHRlc3QuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
