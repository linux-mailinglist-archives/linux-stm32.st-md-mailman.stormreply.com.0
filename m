Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D91EA981D9
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Apr 2025 09:55:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FA5FC78F68;
	Wed, 23 Apr 2025 07:55:24 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3589C78F63
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Apr 2025 07:55:22 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so60739515e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Apr 2025 00:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745394922; x=1745999722;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1eWzS/Ah2cnA75NtUgIRsIHb+DY3iDF+Qb9KegxCV7A=;
 b=LC0oFGzT0Xzkz6ZZMSdIM5bS1OWpPsHQ9lxjgskztt5vP3XxtInA/wDybEXGAcg9Ul
 ypAkQrqpjQFMwsQ70xFP2xOvaQN4nfMAFHR3U2PJE9ekwKQnhX6Y7naQvuSICTpIikKe
 9YW17kneiBaOptJHr+eb6er6Nw7GNUXw6gfWGYiQpG8MehZkBLwABPgO2aeBthUhhRdB
 ACDybqXGvuln7ibkYt5OOjG4Ojq2eFI0yU6/f8LrEZskn7tJnTCczEKIaQZLmdkfJek9
 6zMYJ281Dv/3V5cgayAwUuwvp4VsmrUCLQhuYwsbQk5iOVpbiBnRgKWAtOhl2SgfLfRj
 OIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745394922; x=1745999722;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1eWzS/Ah2cnA75NtUgIRsIHb+DY3iDF+Qb9KegxCV7A=;
 b=l84+vWwamUfRdIvO2aJxjNmG7/TQGASA70cFWp92QK5kxKCn4UPRUMO/aShty0Yluo
 RlIvnNvf05Wn2YTrWJoVbtvQrETeGOs1j1b6paJvSB6/dGm9vW2702UI/bz22dmf5sc8
 inBUmFVfbvs+cGuTJeNEzjqg2ovyAlm+8sSBbS4TNtSx8ggMAT0U5uDq8I6oRASB6Xgk
 bNU7LQ0SaVfkDJWBkf9+JI01sA6Tm92RMSZm/+3GbDfmpCHoKtZKIK35zwwn6LP1So08
 22e8QHRrziAIp6DSoM366a5NKiaS7NvJqQUnIna+ZVOmG3Bpuz7L/k9Qc3qseCZRjWr+
 ZNBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrnIPSfQJLVVtAMq6qeo8OHWrmEXyvtj7pIi0G+6nCaNRj1YtKOey08zRNDkwP8HqIhOcHBufJD6Jf+A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxL/IUPe4+reuH8R05E4OcF6+Es+KQeLpWctQE2XVYbt5TIegi3
 4M8XK7liy9nMBeWWmjePgWKIDNdIepJ8sUDv9zLjuy8inL+bqnuWR/h10LlvF+YKx9UeyfIK/aL
 vYOxjlcd9Z+9UGcVx2d1GlK2rp00=
X-Gm-Gg: ASbGncvSUm/3+BMYvsUhr26qg/u6JkGAa0B6EKCK28FMadF4cCUT95RfQMJd4HELkNn
 Vx/ddhVGo7df/SzJlCqfOQ6iHbplLbPvuqFdWbadNw5RLnNb/fe8gg3IxOGTPtux/uaWRgLBCTI
 WSB/JMjrkttmWG98q+wjPl6Q==
X-Google-Smtp-Source: AGHT+IEetajyp7tewz7gSg2bUmPRDylKdQxo3ZKlMaQaOjNuvNTMi3XEyh1phX3DcIWXuVWrhzLhzxViAkCb79CfcaQ=
X-Received: by 2002:a05:600c:358b:b0:439:9424:1b70 with SMTP id
 5b1f17b1804b1-4406ac17329mr182625395e9.30.1745394921859; Wed, 23 Apr 2025
 00:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250417084015.74154-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250422184813.02b21095@kernel.org>
In-Reply-To: <20250422184813.02b21095@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 23 Apr 2025 08:54:54 +0100
X-Gm-Features: ATxdqUENAmcd1iPlreTGMgox3_qZS9GKX_Vez1-JK_b3xBLNPYkG-7O4wKnzxvI
Message-ID: <CA+V-a8uk33D7m17nOa3tFviq+OEajPFm-haU+oFJwiE3Hvo3Aw@mail.gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v8 4/4] MAINTAINERS: Add entry
 for Renesas RZ/V2H(P) DWMAC GBETH glue layer driver
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

SGkgSmFrdWIsCgpPbiBXZWQsIEFwciAyMywgMjAyNSBhdCAyOjQ44oCvQU0gSmFrdWIgS2ljaW5z
a2kgPGt1YmFAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIDE3IEFwciAyMDI1IDA5OjQw
OjE1ICswMTAwIFByYWJoYWthciB3cm90ZToKPiA+ICtSRU5FU0FTIFJaL1YySChQKSBEV01BQyBH
QkVUSCBHTFVFIExBWUVSIERSSVZFUgo+ID4gK006ICAgTGFkIFByYWJoYWthciA8cHJhYmhha2Fy
Lm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+ID4gK0w6ICAgbmV0ZGV2QHZnZXIua2Vy
bmVsLm9yZwo+ID4gK0w6ICAgbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnCj4gPiAr
UzogICBTdXBwb3J0ZWQKPgo+IEknbSBnb2luZyB0byBtYWtlIHRoaXMgTWFpbnRhaW5lZCB3aGVu
IGFwcGx5aW5nLCBwbGVhc2Ugc2VlOgo+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwv
bmV4dC9wcm9jZXNzL21haW50YWluZXItbmV0ZGV2Lmh0bWwjc3VwcG9ydGVkLXN0YXR1cy1mb3It
ZHJpdmVycwo+Ck9rLCB0aGFua3MgZm9yIHRha2luZyBjYXJlIG9mIHRoaXMuCgpDaGVlcnMsClBy
YWJoYWthcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
