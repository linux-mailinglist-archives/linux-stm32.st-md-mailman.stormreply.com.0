Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B713B9F727
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 15:12:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A1DEC3F952;
	Thu, 25 Sep 2025 13:12:10 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01FB4C36B2D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 13:12:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D6AB76054E;
 Thu, 25 Sep 2025 13:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07E6C4CEF0;
 Thu, 25 Sep 2025 13:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758805927;
 bh=hCbg+xH0PAFSHq/z2bdjQ4pq3+Cnx9PLmBUG/OA2ris=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oAnizgjI5yWSwS247xUL1Al1T++xVE+5Ckc0md+K/OeloABVWqUpTznDhQP7Ha4FM
 z6iyGrVpaWU+VYgcG/8rsA1gQWAmWIyq4dgY7brtt1Vl5h16cutxxXRt+VAH90oVHq
 Hjt/xHdyJxnU770UqWU+ioF2kPwvCUU27LEDHkhTTaLf5x67Mzg80k4F30/nvaC5yy
 OWMFV0jXJYaKYDbfzzLesYN9ITDeHa7prYLFuwb587YSwMc40+UCxnx2w2t8scpj7t
 Ql0bdQc+wIHIAjbDCva1q0rEMfDeM1zWPquSqLTpDRARLjAUVUr3+sZrcQJPy0WTJO
 Mnwluuq3UnhrA==
Date: Thu, 25 Sep 2025 08:12:04 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Message-ID: <g2e5ejykf6nteipzsybbjjjcdvko4yg664uxh57bi3ty3cljh4@5mv5ki2cqyg3>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
 <a8ebec72-eee2-4a02-ac6b-57678aa7c50f@kernel.org>
 <1c90a127-4b39-4cad-9805-d4449990baa7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1c90a127-4b39-4cad-9805-d4449990baa7@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, yijie.yang@oss.qualcomm.com,
 Rob Herring <robh@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 linux-clk@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, aiqun.yu@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Stephen Boyd <sboyd@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, trilok.soni@oss.qualcomm.com
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, Sep 25, 2025 at 02:14:01PM +0530, Taniya Das wrote:
> =

> =

> On 9/25/2025 1:59 PM, Bryan O'Donoghue wrote:
> > On 25/09/2025 00:56, Jingyi Wang wrote:
> >> From: Taniya Das <taniya.das@oss.qualcomm.com>
> >>
> >> SC8280XP camcc only requires the MMCX power domain, unlike SM8450 camcc
> >> which now supports both MMCX and MXC power domains. Hence move SC8280XP
> >> camcc from SM8450.
> >>
> >> Fixes: 842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move
> >> sc8280xp camcc to sa8775p camcc")
> >> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >> ---
> >> =A0 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1=
 -
> >> =A0 1 file changed, 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-
> >> camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-
> >> camcc.yaml
> >> index c1e06f39431e..dbfcc399f10b 100644
> >> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> >> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> >> @@ -63,7 +63,6 @@ allOf:
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0 compatible:
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 contains:
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 enum:
> >> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - qcom,sc8280xp-camcc
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - qcom,sm8450-camcc
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - qcom,sm8550-camcc
> >> =A0=A0=A0=A0=A0 then:
> >>
> > =

> > This is not a revert.
> > =

> > Where does the compat string go ?
> > =

> =

> The compat is now part of
> Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml as part
> of this commit "842fa7482915".
> =

> > You are missing the part where you move the compat string to where you
> > think it should be...
> > =

> =

> It was already moved as mentioned above.
> =


I'm sorry, but I don't see where you say this. =


The commit message is a verbatim copy of the first paragraph of commit
'842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp
camcc to sa8775p camcc")', where that comment makes sense. But here's
you're no longer moving something.

Please help me understand what I'm missing.

> > Also why is this patch appearing in a series about _adding_ Kanaapali to
> > CAMCC ?
> > =

> =

> This was to reduce less dependency on the series.
> =


Had you sent this patch last week, I would have merged it into v6.18 and
there wouldn't have been any dependency.

Regards,
Bjorn

> > NAK
> > =

> > ---
> > bod
> > =

> =

> -- =

> Thanks,
> Taniya Das
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
