Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E79326BC80F
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 09:01:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9F40C6904C;
	Thu, 16 Mar 2023 08:01:45 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D37DC65043
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 08:01:44 +0000 (UTC)
Received: from maxwell.fritz.box ([109.42.114.157]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N5VXu-1qZOzS1ix8-016vCE; Thu, 16 Mar 2023 09:00:48 +0100
From: Jochen Henneberg <jh@henneberg-systemdesign.com>
To: netdev@vger.kernel.org
Date: Thu, 16 Mar 2023 08:59:38 +0100
Message-Id: <20230316075940.695583-1-jh@henneberg-systemdesign.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314123759.132521-1-jh@henneberg-systemdesign.com>
References: 
MIME-Version: 1.0
X-Provags-ID: V03:K1:MF+CTOsuaUq00JRKYZHVnsChLb87wgi4uQ1NbzyyNpJIXRd8oR5
 W4ykBIg0Us5rgmf3C88AvJGFzY9e+D57+Muxbny4/4lOA9pbdfO5pBjBUS0iZsgTHfr1xxa
 vmPbcloq4rtlnFdDspnr2Fi4ReAvnQz+VoN8wpBVhmTesVvd8xPjyBga/xKDXzGiYtxymLg
 Hz52hJjfworWMxsM6lXCg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LIoPf2/TAMs=;QhWFGVa7tyxykKcxVcjlZU+BKF5
 vMT3NkA0jzP5P3RSpMMkPS8EMvKA6XdEyS7Tkktzuy7QZKP4p1vMYCgSgI0w9wVrCF0UonIoh
 5NY+ssi7US/JeldnU15MfQxTsqeZ9daTF3qpmCiCNoKeogTlupK0lFuXzPaCTQ/9EH8CrpGlf
 bXb+oyzUSUHtN6HKn+jaq6857IalkzXBLl5izpyxCYP6YBtR9KQDfpfkZzKp26pPaBFv6PAfj
 8ho4vqYOIyQsL7+5uskISN5ASCrHm0mCGsFT2uw/FwEPzfx/djOupNC7+c1I9BcL21KBkk3g3
 fQZBFKHnfp36vCPUrV9voYEDFcRgOcWyZi72szFR8n+gF5ejb22z60w+n0k7RSLjv3FicU7Ah
 V5nXW9OK51OW8p60ODhXkTQkZgqQxWKoyG8Hxf9z4402qEL13QROPZQzUtUrNe134Hepggwad
 B7izy25PSjIBDhp9iCaBTokYuHwLKPimF2x9nmWwXJB3RvHnV+TQtcQDtf3rPJiu1TluSIHvG
 DoY2WREu2848EqBILmSIbKoIapyfnchC8okgVLSO6UDi2e7H4WV97M8cXBYBl9USVw9VV5ZJe
 5dudodI/nlN87VoLwou1SVpypHp5Me+HTcd94RFufT2RgodBFNRqgHTTmp6MMaInGfYwK9w9O
 fxDQe4JTllrua943bYeBHl+r4l0ZSJTSvF4bBPqc4g==
X-Topics: 
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net V2 0/2] net: stmmac: Premature loop
	termination check was ignored
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

As proposed in [1] here is are the fixes as a patch series that do the
premature end-of-loop check within the goto loop.

The commit messages now tell us which rx path has been fixed.

Jochen Henneberg (2):
  net: stmmac: Premature loop termination check was ignored on rx
  net: stmmac: Premature loop termination check was ignored on ZC rx

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

[1] https://lore.kernel.org/all/Y%2FdiTAg2iUopr%2FOy@corigine.com
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
