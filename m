Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B81B048C1
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Jul 2025 22:39:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DF0CC3F930;
	Mon, 14 Jul 2025 20:39:58 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 280C6C3F92F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Jul 2025 20:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752525595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a5y/8SUZq0rdm2xQZuA/Ya2xOqAO/MdvVu8D3Jo9BDM=;
 b=JQFTIqxzeSjnAQPAF4JnAN4Nt3rSYYIrVlcbLOWDDIKbVX81MkMr+g5ET4KLhZjaeFaB+r
 BqQMow2xfrdbon2TuiG1FbaYewOFyJQuoO6z4DqM6pyNTzeocixRcxEEg1JMKMiuoJbEgW
 qvyXVQBT21wPwdvBiJdfnT98uumkATY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-V5ZD7sV0Nd6XmWPUQmF1YQ-1; Mon, 14 Jul 2025 16:39:43 -0400
X-MC-Unique: V5ZD7sV0Nd6XmWPUQmF1YQ-1
X-Mimecast-MFC-AGG-ID: V5ZD7sV0Nd6XmWPUQmF1YQ_1752525583
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-ae6d6b8eacbso351990966b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Jul 2025 13:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752525582; x=1753130382;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a5y/8SUZq0rdm2xQZuA/Ya2xOqAO/MdvVu8D3Jo9BDM=;
 b=gqKjMDbrLSINjOnIZE+jrTRC3aWEjii+0Rqm7Gu7VziLC3FP/wAprWK0bBhWEgBPHa
 eAgHoFKks1ejg2/G2UJCSkn3rMy6if/0HN6Kn9VYP1dpukzfLS80MqU3IQpyGRCmItEr
 33DTX5Rz8nfCAewQKHoLkKcpQ0v7VUOGE95uy/SAzgJ6zvGa1xpHmTKgviH3nSm22evc
 E+BEg8O0rtgXPGgzZlRL82KMoFxgRAUsFM0CAvhrzHX5zwpkmFzRkXhnXOaWk6XT0qyN
 M30+Ou1YrbpfqWoP77XWrCOeXme0+GKRrFYk7mQC+MU+Safz+wgOxleB2Srdp4+LARmr
 lb2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHSHKg0dTiroxkQ9mDVdFNU2j6TuvamVAH9/qShKpLowB8Rh8aGvHUTPv+VtpU+TN6+zMsQBeZ5aNtpQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwYh/QAzs28ysdBHE7VoclXiOQyfNNwM316NaVOxTcMXO7ezDVN
 No7WU7Y1g9tl1ObHvzVH8+dqdEu8k339KI3up98ntmolhqjVoE9iK+kepIC8q1bx6uPhmVS4NCv
 xQ9E1B9DMUkqN5tw7/R5fsKyEVKj2hCCPhsj5uNfY3XYnr6olTT9EKoHrpZHgzFev4tWodU53Rk
 pIjNeHWJQLp4USFBvrR2+GK1Pt99pDwgDbWCbHMnLuYM4Ji2mIts6Kyt2i
X-Gm-Gg: ASbGncuRR692BpiTrDj0oIrGSH2qBhQD4V595z3/m8dspmRrYQ18IP2qqqlnEcjRSqI
 z3LQwiir0S6mgJlF9iOkRDjPyY1jTkD4XzQcYm9GlNZDeSuogZkU5DUwBZEWy1x18E59XWpE0/k
 Q2JIz+IH3ZE9CjT4sLKI7G
X-Received: by 2002:a17:907:84a:b0:ae3:a240:7ad2 with SMTP id
 a640c23a62f3a-ae6fc6aa6dcmr1561811466b.2.1752525582620; 
 Mon, 14 Jul 2025 13:39:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtOtCIDm5iIRXUzH93pKL+mJg2YxukWxSYyuAjAlCNSpCWGK9PKhS/khXgGAJEgay188lilBak/nz6CZiqGvQ=
X-Received: by 2002:a17:907:84a:b0:ae3:a240:7ad2 with SMTP id
 a640c23a62f3a-ae6fc6aa6dcmr1561809066b.2.1752525582243; Mon, 14 Jul 2025
 13:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
 <20250710-sound-clk-round-rate-v1-4-4a9c3bb6ff3a@redhat.com>
 <c321ed9f-7906-4a92-9202-efb46343ee91@oss.qualcomm.com>
In-Reply-To: <c321ed9f-7906-4a92-9202-efb46343ee91@oss.qualcomm.com>
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 14 Jul 2025 16:39:31 -0400
X-Gm-Features: Ac12FXxNfqVieUoHNPgnW-EodFqKMjypw83pf906bEoCpdOuQyrxKsmWcymmig0
Message-ID: <CABx5tqJzEMUXz0Cbo5siCnwKp2MVON_oGgMnGkb_cg1zv8k5nw@mail.gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2_A_lqvW3oBwv23KuJa-5H29gNIZ51WlTBmlgwqM5Wk_1752525583
X-Mimecast-Originator: redhat.com
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/6] sound: soc: qcom: qdsp6:
 q6dsp-lpass-clocks: convert from round_rate() to determine_rate()
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

SGkgS29ucmFkLAoKT24gVGh1LCBKdWwgMTAsIDIwMjUgYXQgMTI6MDnigK9QTSBLb25yYWQgRHli
Y2lvCjxrb25yYWQuZHliY2lvQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+IE9uIDcvMTAvMjUg
NTo1MSBQTSwgQnJpYW4gTWFzbmV5IHdyb3RlOgo+ID4gVGhlIHJvdW5kX3JhdGUoKSBjbGsgb3Bz
IGlzIGRlcHJlY2F0ZWQsIHNvIG1pZ3JhdGUgdGhpcyBkcml2ZXIgZnJvbQo+ID4gcm91bmRfcmF0
ZSgpIHRvIGRldGVybWluZV9yYXRlKCkgdXNpbmcgdGhlIENvY2NpbmVsbGUgc2VtYW50aWMgcGF0
Y2gKPiA+IG9uIHRoZSBjb3ZlciBsZXR0ZXIgb2YgdGhpcyBzZXJpZXMuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogQnJpYW4gTWFzbmV5IDxibWFzbmV5QHJlZGhhdC5jb20+Cj4gPiAtLS0KPgo+IFJl
dmlld2VkLWJ5OiBLb25yYWQgRHliY2lvIDxrb25yYWQuZHliY2lvQG9zcy5xdWFsY29tbS5jb20+
Cj4KPiBjb21lIHRvIHRoaW5rIG9mIGl0LCB0aGVyZSBhcmUgYSBsb3Qgb2YgZHJpdmVycyB0aGF0
IGNhbiBub3QKPiBkbyBhbnkgcmF0ZSByb3VuZGluZyAtIHBlcmhhcHMgd2UgY291bGQgaW50cm9k
dWNlIGEgTk9QIGltcGxlbWVudGF0aW9uCj4gaW4gdGhlIGNsayBjb3JlIHRoYXQgd2UgY291bGQg
cmVmZXJlbmNlLCBpbnN0ZWFkIG9mIGNvcHlwYXN0aW5nCj4gaW50IGZvbyguLi4pIHsgInJldHVy
biAwIiB9PwoKSSdsbCBsb29rIGF0IHRoYXQgZm9yIGEgc2Vjb25kIHJvdW5kIG9mIGNsZWFudXAg
b25jZSBhbGwgb2YgdGhlCnJvdW5kX3JhdGVzIGhhdmUgYmVlbiByZW1vdmVkIGZyb20gdGhlIHRy
ZWUuIEZyb20gd2hhdCBJIHJlY2FsbCBhYm91dAp0aGUgfjIwMCBvciBzbyByb3VuZF9yYXRlIGlt
cGxlbWVudGF0aW9ucyBpbiB0aGUga2VybmVsIHRyZWUsIHRoZXJlCndlcmUgbWF5YmUgb25seSA1
IG9yIHNvIHRoYXQgY292ZXIgdGhpcyBub29wIGNhc2UuIFFDIHNlZW1lZCB0byBoYXZlCnRoZSBt
b3N0IGZyb20gd2hhdCBJIHJlY2FsbC4KCkl0IHdvdWxkbid0IGJlIGhhcmQgdG8gbWFrZSBhIENv
Y2NpbmVsbGUgc2NyaXB0IHRvIGxvb2sgZm9yIHRoZSBub29wCmRldGVybWluZV9yYXRlKCkgaW1w
bGVtZW50YXRpb25zLgoKQnJpYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
