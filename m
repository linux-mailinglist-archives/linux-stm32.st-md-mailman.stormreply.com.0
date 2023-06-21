Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 321DC737BF1
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jun 2023 09:18:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D260EC65E4F;
	Wed, 21 Jun 2023 07:18:18 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E1A0C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 07:18:17 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-be49e41a3d6so4238028276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 00:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687331897; x=1689923897;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MAOzKmP5oeuqoPZ8mGCdEqZLbk+qvPzQr7Zb3mr9TxY=;
 b=YUNuT3Cuka98cObtbBUQDTjmWE/tBZlANmdRnPMI+WdEOUG063dg6xfMiXUdEHN3Nf
 KR4Po5I2lVgUepBl0GHneuu7qLdda2OQrptbxlbwCH1U/WTAroLqIat7tJwdjPTw3IwA
 VW+mazXpNwQa9q87geLhOesYquwiph38x45+ZL4ULD0zirFpSddBShdb7+Q7FyKJfJm2
 +GL000qgd7YXT9Q9PIa5xhlsbkg2EaPDdeaQWTKKMV/qZvUEy9q6Kayv6NOL8m6U2tVv
 HN0X88lYBJEQG6deggF9ZobqYZDQWDXp9vkaZmD4+gvbi6lWLcxESWHDlOEbIdn7pzhE
 MYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687331897; x=1689923897;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MAOzKmP5oeuqoPZ8mGCdEqZLbk+qvPzQr7Zb3mr9TxY=;
 b=GF3d418MFOmWEvUeXNiB5N1Ks3jVj23toypx7/V/HJbRMRsdEBIfF9D0LZlBpnXuRI
 hYnS9MMB7rvTXdej0+hK5vSKKz5g9SNZe/cWkoBWu5aCZ7Qn30oLGFQ6b5PO/kedHUrQ
 4fFcAcqU9cDmRHJTtyYnyAEQ4Rtj3mRXsfNrMig6WhODTQAjF0mA0eY21KTNWKkDBYiK
 SgvYqwR6DheHNYEn7Ij8I81QC20v9UMhitr3W1DaYBn9fJ1AeWpT9lkk2ChSiOWHEVgo
 DpoO5w7RXnS5jWHOC71PnJ8zI3MFvaPAb6evqaUzxFbN0SLKoPJplciHSgm4JyWemCc5
 tAIg==
X-Gm-Message-State: AC+VfDyYYo6pJBBFN2bqzEVQ0mBndzYpejNfV8qB+9HjiBQB5hMlmWUM
 +/E3INN+nlrDMpPG3STSsnBwCIQx4hjrYaXhUZVMv8My0lB49pUd
X-Google-Smtp-Source: ACHHUZ7x21xxT6KjFP9038FIfz1FmoHroQoN+E6LWDijzKd21UMlCjyfB1Q3cK+4JYbIYvLYb13iRyy+y0cKToHfFt8=
X-Received: by 2002:a25:1686:0:b0:bac:f582:eefd with SMTP id
 128-20020a251686000000b00bacf582eefdmr5430321ybw.35.1687331896900; Wed, 21
 Jun 2023 00:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230620104349.834687-1-valentin.caron@foss.st.com>
In-Reply-To: <20230620104349.834687-1-valentin.caron@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Jun 2023 09:18:05 +0200
Message-ID: <CACRpkdZO+_UsPUKVTG-7v=zMposGh_j-2Nf-C_BUPUUqxypxXQ@mail.gmail.com>
To: Valentin Caron <valentin.caron@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: set default gpio line
	names using pin names
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

T24gVHVlLCBKdW4gMjAsIDIwMjMgYXQgMTI6NDPigK9QTSBWYWxlbnRpbiBDYXJvbgo8dmFsZW50
aW4uY2Fyb25AZm9zcy5zdC5jb20+IHdyb3RlOgoKPiBBZGQgc3RtMzJfcGN0cmxfZ2V0X2Rlc2Nf
cGluX2Zyb21fZ3BpbyBmdW5jdGlvbiB0byBmaW5kIGEgc3RtMzIgcGluCj4gZGVzY3JpcHRvciB3
aGljaCBpcyBtYXRjaGluZyB3aXRoIGEgZ3Bpby4KPiBNb3N0IG9mIHRoZSB0aW1lIHBpbiBudW1i
ZXIgaXMgZXF1YWwgdG8gcGluIGluZGV4IGluIGFycmF5LiBTbyB0aGUgZmlyc3QKPiBwYXJ0IG9m
IHRoZSBmdW5jdGlvbiBpcyB1c2VmdWwgdG8gc3BlZWQgdXAuCj4KPiBBbmQgZHVyaW5nIGdwaW8g
YmFuayByZWdpc3Rlciwgd2Ugc2V0IGRlZmF1bHQgZ3BpbyBuYW1lcyB3aXRoIHBpbiBuYW1lcy4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFZhbGVudGluIENhcm9uIDx2YWxlbnRpbi5jYXJvbkBmb3NzLnN0
LmNvbT4KCklmIEkgZ2V0IHNvbWUgQUNLIGZyb20gdGhlIFNUTTMyIHBpbmN0cmwgbWFpbnRhaW5l
cnMgSSBjYW4gbWVyZ2UKdGhpcywgc2VlbXMgdXNlZnVsISBNYXliZSB5b3UgYWxyZWFkeSByZXZp
ZXdlZCBpdCBpbnRlcm5hbGx5IGF0IFNUPwpJIHBlcnNvbmFsbHkgZG9uJ3QgbWluZCBpZiB5b3Ug
YnJpbmcgb3ZlciBpbnRlcm5hbCByZXZpZXdlZC1ieSB0YWdzLgoKWW91cnMsCkxpbnVzIFdhbGxl
aWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
