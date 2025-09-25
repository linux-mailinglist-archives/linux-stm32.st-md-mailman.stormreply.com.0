Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 159BBB9F79B
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 15:15:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92F8BC3F952;
	Thu, 25 Sep 2025 13:15:01 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADEF1C36B2D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 13:14:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BE14860584
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 13:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687F7C16AAE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 13:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758806098;
 bh=062M6/8j4NBzg2XWFjfBe/0J/9992fP3Zjk0wG8eK8s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=J3jlgsRY0/E6Z4oiW+LnGS/HJQC3hSvvTz3GdG2WpmcNMywVtx5FgvBYswTN0y63A
 CY7WZCYcrAvR9n5JYYhPld9yuB0K9R3zwKH5JMCrQLvqq+Tpqc8+aJft2R8pZ/YDjO
 xKYKkvQlXMv2dLj6FRuMFAlZqaguPnpSCv/FmuQ7egNRDcziNADCPrnI0FfuG4fe6t
 SHS7/m5vr0YzA1bm5ZraTT9wnwijSpxEKS7+nwVNJ+wqNmkIf9zjXEKZm9xpVaJota
 ESagvtM5tb0GlYoHqxN4kwYAVVve2IhoFrMwNApJ1J2+O0RxOZpJx+Gqbiz0BfskDv
 kxT3RDlfI7/wA==
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-b55562f3130so670633a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 06:14:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWkrvcmQcvzB9KjUeVF4NMEH5btiR1m2Naa7bFRnR3zDRxRiJyoYOfjjvunUMpSA9QYoNqP+HK2L6Zn3A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywd+E/0KjJKH/Bjhr/8LvgMopioEtAH1xDkIoQsbon7sszJhky7
 iu9EC8AGBU0ZiegwFZ6pjMYEmPy7dqMBMzGnP/lLoP6HqhXEVjsXrhCI/TzF/BBPHt5g27BTucc
 KBXgpV2tUUpO/Yo+ChGTPeEKWnyN5PeM=
X-Google-Smtp-Source: AGHT+IEZTnk4r2+Yb8GhN2efY3oHv0w7Pj85s3V/DNwMNZqwPOEwouLCSWf6XxrASX7zuc/9JwLdyD/Xi3x6JTBBRwk=
X-Received: by 2002:a17:902:ebca:b0:269:ba77:4eea with SMTP id
 d9443c01a7336-27ed4a92b47mr39799145ad.46.1758806097880; Thu, 25 Sep 2025
 06:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
In-Reply-To: <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 25 Sep 2025 22:14:44 +0900
X-Gmail-Original-Message-ID: <CAJKOXPc2LwFCW8w5kDEZPAOPz1Y_ix0=jjUHQDHXW03wdcufsg@mail.gmail.com>
X-Gm-Features: AS18NWCtGqOMFzAGGyQqpY8JXXlJLDCy6kxa6YEKNYiE0F2TiXpsp24xv7MAzJw
Message-ID: <CAJKOXPc2LwFCW8w5kDEZPAOPz1Y_ix0=jjUHQDHXW03wdcufsg@mail.gmail.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, yijie.yang@oss.qualcomm.com,
 Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, aiqun.yu@oss.qualcomm.com,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 trilok.soni@oss.qualcomm.com
Subject: Re: [Linux-stm32] [PATCH 2/9] dt-bindings: clock: sm8450-camcc:
 Remove sc8280xp camcc to from sm8450 camcc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, 25 Sept 2025 at 08:57, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>
> From: Taniya Das <taniya.das@oss.qualcomm.com>
>
> SC8280XP camcc only requires the MMCX power domain, unlike SM8450 camcc
> which now supports both MMCX and MXC power domains. Hence move SC8280XP
> camcc from SM8450.
>
> Fixes: 842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp camcc to sa8775p camcc")

Trim your cc list. You do not have to send it to 50 people.

The patch is obviously NAK, if you bothered to test it, you would see warnings
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
